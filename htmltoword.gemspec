# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'htmltoword/version'

Gem::Specification.new do |spec|
  spec.name          = "htmltoword"
  spec.version       = Htmltoword::VERSION
  spec.authors       = ["Nicholas Frandsen, Cristina Matonte"]
  spec.email         = ["nick.rowe.frandsen@gmail.com, anitsirc1@gmail.com"]
  spec.description   = %q{Convert html to word docx document.}
  spec.summary       = %q{This simple gem allows you to create MS Word docx documents from simple html documents. This makes it easy to create dynamic reports and forms that can be downloaded by your users as simple MS Word docx files.}
  spec.homepage      = "http://github.com/karnov/htmltoword"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*.{rb,xslt,docx}") + %w{ bin/htmltoword README.md Rakefile }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack"
  spec.add_dependency "nokogiri"
  spec.add_dependency "rubyzip", ">= 1.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "methadone"
  spec.add_development_dependency "rmultimarkdown"
end
