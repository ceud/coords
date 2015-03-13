# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coords/version'

Gem::Specification.new do |spec|
  spec.name          = "coords"
  spec.version       = Coords::VERSION
  spec.authors       = ["Craig Allan"]
  spec.email         = ["ceudonym@gmail.com"]
  spec.summary       = %q{A small suite of coordinate system classes.}
  spec.description   = %q{Coordinate system library enabling cross-system conversions.}
  spec.homepage      = "https://github.com/ceud/coords"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  # spec.add_development_dependency "rspec-nc"
  # spec.add_development_dependency "guard"
  # spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
