# -*- encoding : utf-8 -*-
require_relative "element/section"
require_relative "writer"
module Rubyword
  class Document

    include Writer
    
    attr_accessor :sections, :init_rid

    def initialize
      @sections = []
      @init_rid = 6
    end

    def addSection(style = nil)
      @section = Element::Section.new(@sections.count + 1, style, self)
      @sections.push(@section)
      @section
    end
  end
  
end
