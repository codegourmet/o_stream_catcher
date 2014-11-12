# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'o_stream_catcher/version'

Gem::Specification.new do |gem|
  gem.name          = "o_stream_catcher"
  gem.version       = OStreamCatcher::VERSION
  gem.authors       = ["Markus Seeger"]
  gem.email         = ["mail@codegourmet.de"]
  gem.description   = "Catches stdout and stderr for ruby blocks."
  gem.summary       = "pass in a block and get the result, stdout and stderr returned."
  gem.homepage      = "https://github.com/codegourmet/o_stream_catcher"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake",  "~> 10.1"
  gem.add_development_dependency "guard-minitest"
  gem.add_development_dependency "minitest"
  gem.add_development_dependency "minitest-reporters"
  gem.add_development_dependency "simplecov"
end
