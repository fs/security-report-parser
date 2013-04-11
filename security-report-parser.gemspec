# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'security-report-parser'
  spec.version       = Security::Report::Parser::VERSION
  spec.authors       = ["Timur Vafin"]
  spec.email         = ["timur.vafin@flatstack.com"]
  spec.description   = %q{Used to parse montly reports from our security guard.}
  spec.summary       = %q{Used to parse montly reports from our security guard.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^/bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'spreadsheet'
  spec.add_dependency 'ansi'
  spec.add_dependency 'thor'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'debugger'
end
