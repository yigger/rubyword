module Rubyword
  module Element
    class Section
      attr_accessor :section_id, :style, :text, :aa
      
      def initialize(section_count, style = nil)
        @section_id = section_count
        @style = Style::Section.new(style)
      end

      def generate(&block)
        !block.nil? && block.arity < 1 ? instance_eval(&block) : block[self]
      end

    end
  end
end