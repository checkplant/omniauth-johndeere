# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/johndeere/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-johndeere"
  spec.version       = Omniauth::Johndeere::VERSION
  spec.authors       = ["Romulo Pereira"]
  spec.email         = ["romuloccomp@gmail.com"]

  spec.summary       = %q{John Deere Omniatuh2}
  spec.description   = %q{John Deere Omniatuh2}
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '1.3.1'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
