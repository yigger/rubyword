# -*- coding: utf-8 -*-
require_relative 'base'
require_relative 'text'
require_relative 'footer'

module Rubyword
  module Element
    class Section < Base
      
      include Text
      include Footer

      attr_accessor :section_id, :style
      
      def initialize(section_count, style = nil)
        @section_id = section_count
        @style = Style::Section.new(style)
        super()
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

    end
  end
end