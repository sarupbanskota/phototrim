# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phototrim/version'

Gem::Specification.new do |spec|
  spec.name          = "phototrim"
  spec.version       = Phototrim::VERSION
  spec.authors       = ["Sarup Banskota"]
  spec.email         = ["sbanskota08@gmail.com"]
  spec.summary       = %q{Simple gem that helps with resizing a bunch of photos}
  spec.description   = %q{Makes simple calls to RMagick methods and scales photos}
  spec.homepage      = "http://rubygems.org/gems/phototrim"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rmagick', '2.13.4'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'rake', '~> 0'
end
