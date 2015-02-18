# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kajabi_parsley/version'

Gem::Specification.new do |spec|
  spec.name          = "kajabi_parsley"
  spec.version       = KajabiParsley::VERSION
  spec.authors       = ["Brendon Murphy"]
  spec.email         = ["xternal1+github@gmail.com"]

  spec.summary       = %q{Helpers and assets for the Parsley js}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/Kajabi/kajabi_parsley"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'parsley-rails', '~> 2.0.3'

  spec.add_development_dependency "rails"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
