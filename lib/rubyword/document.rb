# -*- encoding : utf-8 -*-
require_relative "element/section"
require_relative "writer"
module Rubyword
  class Document

    include Writer
    
    attr_accessor :sections, :init_rid
    attr_accessor :toc, :header, :footer
    
    def self.generate(filename, options = {}, &block)
      rubyword = new(options, &block)
      rubyword.save(filename)
    end

    def initialize(options={}, &block)
      @sections = []
      @init_rid = 6
      @toc = false
      
      instance_eval(&block) if block_given?
    end

    def addSection(style = nil)
      @section = Element::Section.new(@sections.count + 1, style, self)
      @sections.push(@section)
      @section
    end

    def section(&block)
      @section = Element::Section.new(@sections.count + 1, nil, self)
      @section.generate(&block) if block_given?
    end

    def toc(switch=false)
      @toc = switch
    end

    def header(text)
      @header = text
    end

    def footer(text, align='center')
      @footer = {
        text: text,
        align: align
      }
    end

  end
  
end
