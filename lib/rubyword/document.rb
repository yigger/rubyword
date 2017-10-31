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

      # module Write to create word document
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
      @section
    end

    def title_directory(option= {})
      @toc.merge!(open: true)
      @toc.merge!(option)
    end

    # add header and footer
    ['header', 'footer'].each do |method_name|
      define_method "add_#{method_name}" do |text, options={}|
        instance_variable_set("@#{method_name}", {
                                id: 1,
                                text: text,
                                rid: self.init_rid,
                                type: method_name,
                                style: options
                              })
        self.content_types << {
          "/word/#{method_name}1.xml" => "application/vnd.openxmlformats-officedocument.wordprocessingml.#{method_name}+xml"
        }
        self.rels_documents << {
          Id: "rId#{self.init_rid}", 
          Type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/#{method_name}", 
          Target: "#{method_name}1.xml"
        }
        self.init_rid = self.init_rid + 1
      end
    end

    # initialize doc information
    def information(options={})
      @doc_info = options
    end

  end
end
