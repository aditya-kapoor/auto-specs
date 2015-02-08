# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto_specs/version'

Gem::Specification.new do |spec|
  spec.name          = "auto_specs"
  spec.version       = AutoSpecs::VERSION
  spec.authors       = ["Aditya Kapoor"]
  spec.email         = ["aditya.kapoor@vinsol.com"]
  spec.summary       = "Adds certain tasks that would automatically generate some specs for you."
  spec.description   = "Don't Write Specs Yourself."
  spec.homepage      = "https://github.com/aditya-kapoor/auto-specs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
