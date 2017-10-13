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
      @init_rid = 7
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
      self.sections.push(@section)
      @section.instance_eval(&block) if block_given?
    end

    def open_toc(switch=false)
      @toc = switch
    end

    def add_header(text, options={})
      @header = {
        id: 1,
        text: text,
        rid: self.init_rid,
        text_align: options[:align] || 'center',
        type: 'header'
      }
      self.init_rid = self.init_rid + 1
    end

    def add_footer(text, options={})
      @footer = {
        id: 1,
        text: text,
        rid: self.init_rid,
        text_align: options[:align] || 'center',
        nums_type: options[:nums_type],
        type: 'footer'
      }
      self.init_rid = self.init_rid + 1
    end

  end
  
end
