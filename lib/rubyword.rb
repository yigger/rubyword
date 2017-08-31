# encoding: UTF-8
# get remote package
require 'nokogiri'
require 'zip'

# get local package
require_relative 'element/container'
require_relative 'element/section'
require_relative 'style/section'
require_relative 'writer/base'
Dir.foreach(File.join(File.dirname(__FILE__), 'writer')) do |filename|
  unless ['.', '..', 'base'].include?(filename)
    require_relative "writer/#{filename}"
  end
end

module Rubyword
  VERSION = '0.1.0'
  TEMP_PATH = File.join(File.expand_path('../../', __FILE__), 'temp')
  WORD_TEMP_PATH = File.join(File.expand_path('../../', __FILE__), 'template')

  class Rubyword
    attr_accessor :sections
    def initialize
      @sections = []
    end

    def addSection(style = nil)
      @section = Element::Section.new(@sections.count + 1, style)
      @sections.push(@section)

      @section
    end

    def save(filename = 'test.doc')
      # part
      writer = Writer::Writer.new(self)
      writer.save(filename)
    end
  end
  
end

