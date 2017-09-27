module Rubyword
  module Element
    class Section
      attr_accessor :section_id, :style, :text, :footer

      def initialize(section_count, style = nil)
        @section_id = section_count
        @style = Style::Section.new(style)
      end

      def addFooter
        footer = Footer.new
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

    end
  end
end