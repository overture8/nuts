# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nuts/version"

Gem::Specification.new do |s|
  s.name        = "nuts"
  s.version     = Nuts::VERSION
  s.authors     = ["Phil"]
  s.email       = ["phil.mcclure@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Install fonts from fontsquirrel.com with ease}
  s.description = %q{Install fonts from fontsquirrel.com with ease}

  s.rubyforge_project = "nuts"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
