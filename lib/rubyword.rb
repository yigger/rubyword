# encoding: UTF-8
# get remote package
require 'nokogiri'
require 'zip'

# get local package
require_relative "element/container"
require_relative "element/section"
require_relative 'style/section'
require_relative 'writer/writer'

module Rubyword
  class Rubyword
    attr_accessor :sections
    VERSION = '0.1.0'
    def initialize
      @sections = []
    end

    def addSection(style = nil)
      @section = Element::Section.new(@sections.count + 1, style)
      @sections.push(@section)

      @section
    end

    def save
      # part
      writer = Writer::Writer.new
      writer.save
    end
  end
end

