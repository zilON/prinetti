# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prinetti/version'

Gem::Specification.new do |spec|
  spec.name        = 'prinetti'
  spec.version     = Prinetti::VERSION
  spec.date        = '2014-05-31'
  spec.summary     = "Prinetti"
  spec.description = "Gem for communication with prinetti service"
  spec.authors     = ["Sergey Tkachenko"]
  spec.email       = 'serg@shiramori.fi'
  spec.homepage    = 'http://github.com/creeonix/prinetti'
  spec.license     = 'MIT'

  spec.files          = Dir['lib/**/*']
  spec.require_path   = "lib"

  spec.add_dependency "nokogiri", "~> 1.6.2"

  spec.add_development_dependency "bundler",  "~> 1.3"
  spec.add_development_dependency "rspec",  "~> 3.0.0rc1"
end
