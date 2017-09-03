module Rubyword
  module Element
    class Section < Container
      attr_accessor :section_id, :style

      def initialize(section_count, style = nil)
        @section_id = section_count
        @style = Style::Section.new(style)
      end

      def headers

      end

      def footers

      end

      def different_first_page

      end

    end
  end
end