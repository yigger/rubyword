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

			def text(text, style=nil)
				@e_text ||= Text.new(@rubyword, @relation_rids)
				call_method_name = __callee__.to_s
				@e_text.write_object(text, call_method_name, style)
			end
			alias :title_1 :text
			alias :title_2 :text
			alias :title_3 :text
			alias :title_4 :text

    end
  end
end