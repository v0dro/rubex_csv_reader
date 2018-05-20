# coding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

require 'rubex_csv/version.rb'

CSVReader::DESCRIPTION = <<MSG
A simple ruby gem for reading CSV files written entirely in Rubex.
MSG

Gem::Specification.new do |spec|
  spec.name          = 'rubex_csv'
  spec.version       = CSVReader::VERSION
  spec.authors       = ['Sameer Deshmukh']
  spec.email         = ['sameer.deshmukh93@gmail.com']
  spec.summary       = CSVReader::DESCRIPTION
  spec.description   = CSVReader::DESCRIPTION
  spec.homepage      = "http://github.com/v0dro/rubex_csv_reader"
  spec.license       = 'BSD-2'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rubex', '0.1.1'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry-byebug'
end
