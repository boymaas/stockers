# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stockers/version'

Gem::Specification.new do |spec|
  spec.name          = "stockers"
  spec.version       = Stockers::VERSION
  spec.authors       = ["Boy Maas"]
  spec.email         = ["boy.maas@gmail.com"]
  spec.description   = %q{Stockers game logic seperated from delivery framework}
  spec.summary       = %q{Stockers game logic}
  spec.homepage      = "http://www.stockers.nl"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "data_mapper", "1.2.0"
  spec.add_dependency "dm-postgres-adapter", "1.2.0"

  spec.add_dependency "pg", "0.15.0"

  # spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "machinist", "2.0"
  spec.add_development_dependency "dm-machinist", "0.0.1"
  spec.add_development_dependency "database_cleaner", "0.9.1"
end
