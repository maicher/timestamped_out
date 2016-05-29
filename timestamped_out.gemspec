# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timestamped_out/version'

Gem::Specification.new do |spec|
  spec.name          = 'timestamped_out'
  spec.version       = TimestampedOut::VERSION
  spec.authors       = ['kjm']
  spec.email         = ['krzysztof.maicher@gmail.com']

  spec.summary       = 'A class for prepending timestamps to Ruby standard out and error.'
  spec.homepage      = 'https://github.com/maicher/formatted_out'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
