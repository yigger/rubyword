# -*- encoding : utf-8 -*-
require_relative "element/section"
require_relative "writer"
module Rubyword
  class Document
    attr_accessor :sections, :init_rid
    attr_accessor :toc, :header, :footer
    include Writer

    def self.generate(filename, options = {}, &block)
      rubyword = new(options, &block)
      rubyword.save(filename)
    end

    def initialize(options={}, &block)
      @sections, @toc, @init_rid = [], {}, 7
      instance_eval(&block) if block_given?
    end

    def section(style=nil, &block)
      @section = Element::Section.new(@sections.count + 1, style, self)
      self.sections << @section
      @section.instance_eval(&block) if block_given?
    end

    def title_directory(option= {})
      @toc.merge!(open: true)
      @toc.merge!(option)
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

    def add_footer(text=nil, options={})
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
