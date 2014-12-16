# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dracarys/version'
Gem::Specification.new do |gem|
  gem.name = "dracarys"
  gem.version = Dracarys::VERSION
  gem.authors = ["Shiv Deepak"]
  gem.email = ["shiv@hackerrank.com"]
  gem.description = %q{Rails middleware for reporting breakpoints with timestamps.}
  gem.summary = %q{Rails middleware for reporting breakpoints with timestamps.}
  gem.homepage = "http://github.com/interviewstreet/dracarys"
  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest", "~> 5.0"
end
