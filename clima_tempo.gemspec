$:.push File.expand_path("../lib", __FILE__)
require "clima_tempo/version"

Gem::Specification.new do |s|
  s.name        = "clima_tempo"
  s.version     = ClimaTempo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rogério Zambon"]
  s.email       = ["rogeriozambon@gmail.com"]
  s.homepage    = "http://github.com/rogeriozambon/clima_tempo"
  s.summary     = "Get brazilian weather values of the ClimaTempo."
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "rake"
  s.add_dependency "nokogiri", ">= 1.6.3"

  s.add_development_dependency "fakeweb", ">= 1.3"
  s.add_development_dependency "rspec", ">= 3.1.0"
end
