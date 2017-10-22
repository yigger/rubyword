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
  spec.homepage      = "https://github.com/yigger/rubyword"
  spec.license = "MIT"
  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "rubyzip"
  spec.add_development_dependency "fastimage"
end
