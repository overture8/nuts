#!/usr/bin/env ruby
require 'net/http'
require 'json'
require 'thor'

class Nuts::CLI < Thor
  desc "list", "list fonts"
  def list(term=nil)
    req = Net::HTTP::Get.new(all_url.path)
    res = Net::HTTP.start(all_url.host, all_url.port) do |http|
      http.request(req)
    end
    result = JSON.parse(res.body)
    if term
      filtered = result.find_all { |item| item["family_name"] =~ /#{term}/i }
    else
      filtered = result
    end
    print(filtered)
  end

  private

  def print(data)
    data.each do |value|
      item = value['family_name']
      puts "#{item}"  
    end
  end

  def all_url
    @url ||= URI.parse('http://www.fontsquirrel.com/api/fontlist/all')
  end
end


