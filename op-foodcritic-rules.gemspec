# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'op-foodcritic-rules'
  spec.version       = '0.0.1'
  spec.authors       = ['Ofir Petrushka']
  spec.email         = ['ofir.petrushka@gmail.com']
  spec.description   = 'Custom foodcritic rules.'
  spec.summary       = 'Custom foodcritic rules.'
  spec.homepage      = 'https://github.com/ofir-petrushka/op-foodcritic-rules'
  spec.license       = 'Apache'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.2'

  spec.add_dependency 'foodcritic'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end