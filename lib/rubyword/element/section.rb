# -*- coding: utf-8 -*-
require_relative 'base'
require_relative 'text'

module Rubyword
  module Element
    class Section
            
      attr_accessor :section_id, :style, :rubyword, :relation_rids
      attr_accessor :e_text

      def initialize(section_count, style = nil, rubyword=nil)
        @section_id = section_count
        @style = Style::Section.new(style)
        @rubyword = rubyword
        @relation_rids = []
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

      def method_missing(method, *args)
        if method.to_s == 'text'
          @e_text ||= Text.new(@rubyword, @relation_rids)
          @e_text.write_object(*args)
        else
          super()
        end
      end

    end
  end
end