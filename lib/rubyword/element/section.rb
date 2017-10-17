# -*- coding: utf-8 -*-
require_relative 'base'
require_relative 'text'
require_relative 'link'
require_relative 'page_break'

module Rubyword
  module Element
    class Section
            
      attr_accessor :section_id, :style, :rubyword, :section_objects
      attr_accessor :e_text, :e_list, :e_link, :e_page_break

      def initialize(section_count, style = nil, rubyword=nil)
				@section_id = section_count
				@style = style
        @rubyword = rubyword
        @section_objects = []
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

			def text(text, style=nil)
        @e_text ||= Text.new(@rubyword)
        @section_objects << @e_text.class.name.split('::').last
				call_method_name = __callee__.to_s
				@e_text.write_object(text, call_method_name, style)
			end
			alias :title_1 :text
			alias :title_2 :text
			alias :title_3 :text
			alias :title_4 :text

      def list
        @e_list ||= List.new(@rubyword)
        @section_objects << @e_list.class.name.split('::').last
        @e_list.write_object(text, style)
      end

      def image
        # @section_objects << __method__.to_s
      end

      def chart
        # @section_objects << __method__.to_s
      end

      def link(text, link, style=nil)
        @e_link ||= Link.new(@rubyword)
        @e_link.write_object(text, link, style)
        @section_objects << @e_link.class.name.split('::').last
      end

      def page_break(break_num=1)
        @e_page_break ||= PageBreak.new(@rubyword)
        @e_page_break.write_object(break_num)
        @section_objects << @e_page_break.class.name.split('::').last
      end

      def text_break

      end

    end
  end
end