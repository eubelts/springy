# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'springy/version'

Gem::Specification.new do |spec|
  spec.name          = "springy"
  spec.version       = Springy::VERSION
  spec.authors       = ["eubelts"]
  spec.email         = ["eunicesausbeltran@yahoo.com"]

  spec.summary       = %q{Query builder for Elasticsearch}
  spec.description   = %q{ActiveRecord-like query builder for Elasticsearch}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "elasticsearch",  "~> 5.0"

  spec.add_development_dependency "rspec",          "~> 3.2"
  spec.add_development_dependency "fuubar",         "~> 2.0"
  spec.add_development_dependency "pry",            "~> 0.10"
  spec.add_development_dependency "awesome_print",  "~> 1.6"
  spec.add_development_dependency "yard",           "~> 0.9"
end
