# -*- encoding : utf-8 -*-
require_relative "element/section"
require_relative "writer"
module Rubyword
  class Document
    attr_accessor :sections, :init_rid
    attr_accessor :relation_rids, :content_types, :rels_documents, :images
    attr_accessor :header, :footer
    attr_accessor :doc_info, :toc
    include Writer

    def self.generate(filename, options = {}, &block)
      rubyword = new(options, &block)
      rubyword.save(filename)
    end

    def initialize(options={}, &block)
      @sections, @toc, @init_rid, @doc_info = [], {}, 7, {}
      @relation_rids = []
      @content_types = []
      @rels_documents = []
      @images = []
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
      self.content_types << {
        "/word/header1.xml" => "application/vnd.openxmlformats-officedocument.wordprocessingml.header+xml"
      }
      self.rels_documents << {
        Id: "rId#{self.init_rid}", 
        Type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/header", 
        Target: "header1.xml"
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
      self.content_types << {
        "/word/footer1.xml" => "application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml"
      }
      self.rels_documents << {
        Id: "rId#{self.init_rid}", 
        Type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer",
        Target: "footer1.xml"
      }
      self.init_rid = self.init_rid + 1
    end

    def information(options={})
      @doc_info = options
    end

  end
end
