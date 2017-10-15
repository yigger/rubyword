# -*- coding: utf-8 -*-
require_relative 'base'
require_relative 'text'

module Rubyword
  module Element
    class Section
            
      attr_accessor :section_id, :style, :rubyword, :relation_rids, :section_objects
      attr_accessor :e_text, :e_list

      def initialize(section_count, style = nil, rubyword=nil)
				@section_id = section_count
				@style = style
        @rubyword = rubyword
        @relation_rids = []
        @section_objects = []
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

			def text(text, style=nil)
        @e_text ||= Text.new(@rubyword, @relation_rids)
        @section_objects << __method__.to_s
				call_method_name = __callee__.to_s
				@e_text.write_object(text, call_method_name, style)
			end
			alias :title_1 :text
			alias :title_2 :text
			alias :title_3 :text
			alias :title_4 :text

      def list
        @e_list ||= List.new(@rubyword, @relation_rids)
        # @section_objects << __method__.to_s
        @e_list.write_object(text, style)
      end

      def image
        @section_objects << __method__.to_s
      end

      def chart
        @section_objects << __method__.to_s
      end

      def link
        @section_objects << __method__.to_s
      end

    end
  end
end