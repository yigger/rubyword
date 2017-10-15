# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubyword/version"

Gem::Specification.new do |spec|
  spec.name          = "rubyword"
  spec.version       = Rubyword::VERSION
  spec.authors       = ["young"]
  spec.email         = ["youngjy6@gmail.com"]

  spec.summary       = %q{Generate MS Word for ruby}
  spec.description   = %q{RubyWord is a simple, efficient Word document generation gem and easy to generate docx file.}
  spec.homepage      = "https://github.com/ruby-office/rubyword"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
