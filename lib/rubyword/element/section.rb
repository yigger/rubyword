# -*- coding: utf-8 -*-
require_relative 'base'
require_relative 'text'
require_relative 'header'
require_relative 'footer'

module Rubyword
  module Element
    class Section < Base
      
      include Text
      include Footer
      include Header
      
      attr_accessor :section_id, :style, :relation_rids, :init_rid, :texts, :rubyword
      
      def initialize(section_count, style = nil, rubyword=nil)
        @section_id = section_count
        @style = Style::Section.new(style)
        @texts = []
        @rubyword = rubyword
        @relation_rids = []
        @init_rid = @rubyword.init_rid
        super()
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

    end
  end
end