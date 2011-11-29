require 'nuts'
require 'net/http'
require 'json'
require 'thor'

class Nuts::CLI < Thor
  URL = "http://www.fontsquirrel.com"

  desc "list [search_term]", "list available fonts"
  def list(term=nil)
    url = URI.parse("#{URL}/api/fontlist/all")
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    result = JSON.parse(res.body)
    if term
      filtered = result.find_all { |item| item["family_urlname"] =~ /#{term}/i }
    else
      filtered = result
    end
    print(filtered)
  end

  desc "show", "show font"
  def show(font_slug=nil)
  end

  desc "install", "install font"
  def install(font_slug=nil)
    `mkdir -p ./app/assets/fonts/#{font_slug} && 
    cd ./app/assets/fonts/#{font_slug} &&
    wget #{URL}/fontfacekit/#{font_slug} &&
    unzip #{font_slug} && 
    sed "s#url('#url('/assets/#{font_slug}/#g" ./stylesheet.css > ./../../stylesheets/#{font_slug}.css
    rm demo.html &&
    rm #{font_slug}`
  end

  private

  def print(data)
    data.each do |value|
      item = value['family_urlname']
      puts "#{item}"  
    end
  end
end


