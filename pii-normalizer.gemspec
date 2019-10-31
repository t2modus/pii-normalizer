# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pii/normalizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'pii-normalizer'
  spec.version       = PII::Normalizer::VERSION
  spec.authors       = ['Andrew Stephenson']
  spec.email         = ['Andrew.Stephenson123@gmail.com']

  spec.summary       = 'Normalizing logic for PII'
  spec.description   = 'A collection of methods to assist in the normalization of PII like names, phones, emails and addresses.'
  spec.homepage      = 'https://github.com/t2modus/pii-normalizer'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency "rake", "~> 10.0"
end
