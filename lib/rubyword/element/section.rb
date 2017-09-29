# -*- coding: utf-8 -*-
require_relative 'base'
require_relative 'text'
require_relative 'header'
require_relative 'footer'
require_relative 'rels'

module Rubyword
  module Element
    class Section < Base
      
      include Text
      include Rels
      include Footer
      include Header
      attr_accessor :section_id, :style, :relation_rids, :init_rid
      
      def initialize(section_count, style = nil)
        @section_id = section_count
        @style = Style::Section.new(style)
        @init_rid = 6
        @relation_rids = []
        super()
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

    end
  end
end