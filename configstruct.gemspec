# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "configstruct"
  spec.version       = File.read(File.expand_path('../CHANGELOG.md', __FILE__))[/([0-9]+\.[0-9]+\.[0-9]+)/]
  spec.authors       = ["mose"]
  spec.email         = ["mose@mose.com"]
  spec.summary       = %q{Lib for managing config files based on OpenStruct.}
  spec.description   = %q{Lib for managing config files based on OpenStruct, includes file saving and prompt at creation.}
  spec.homepage      = "https://github.com/mose/configstruct"
  spec.license       = "MIT"

  spec.files         = ['lib/configstruct.rb','README.md','CHANGELOG.md','LICENSE.txt']
  spec.executables   = []
  spec.test_files    = ['spec/spec_helper.rb','spec/lib/configstruct_spec.rb','/spec/files/config.yml']
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', "~> 3.0"
  spec.add_development_dependency 'coveralls'
end
