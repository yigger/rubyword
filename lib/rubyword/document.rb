# -*- coding: utf-8 -*-
require_relative "element/section"
require_relative "writer"
module Rubyword
  class Document
    include Writer
    attr_accessor :sections
    def initialize
      @sections = []
    end

    def addSection(style = nil)
      @section = Element::Section.new(@sections.count + 1, style)
      @sections.push(@section)
      @section
    end
  end
  
end
