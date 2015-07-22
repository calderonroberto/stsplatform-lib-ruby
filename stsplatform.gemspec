# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stsplatform/version'
#Bundler.require(:default, :development)

Gem::Specification.new do |spec|
  spec.name          = "stsplatform"
  spec.version       = Stsplatform::VERSION
  spec.authors       = ["SenseTecnic"]
  spec.email         = ["rcalderon@sensetecnic.com"]

  spec.summary       = "Allows developers to use the STS Platform API"
  spec.description   = "This gem allows you to access the STS Platform API. For more information visit http://developers.sensetecnic.com"
  spec.homepage      = "http://developers.sensetecnic.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.8.1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
