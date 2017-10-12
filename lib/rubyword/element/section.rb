# -*- coding: utf-8 -*-
require_relative 'base'
require_relative 'text'
require_relative 'header'
require_relative 'footer'

module Rubyword
  module Element
    class Section
            
      attr_accessor :section_id, :style, :rubyword, :relation_rids
      
      EXIST_METHODS = ['text', 'header', 'footer']
      attr_accessor :e_text, :e_header, :e_footer

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
        method = method.to_s
        if EXIST_METHODS.include?(method)
          eval "@e_#{method} = #{method.capitalize}.new(@rubyword, @relation_rids) if @e_#{method}.nil?"
          eval "@e_#{method}.write_object(*args)"
        else
          super()
        end
      end

    end
  end
end