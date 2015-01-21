# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fig_rake/version'

Gem::Specification.new do |spec|
  spec.name          = "fig_rake"
  spec.version       = FigRake::VERSION
  spec.authors       = ["Edward Paget"]
  spec.email         = ["edward@cassetteta.pe"]
  spec.summary       = %q{Utilities to make using Rake and Rails with a fig dev environment pleasant}
  spec.description   = %q{Utilities to make using Rake and Rails with a fig dev environment pleasant}
  spec.homepage      = "https://github.com/edpaget/fig_rake"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
