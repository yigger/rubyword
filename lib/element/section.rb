module Rubyword
  module Element
    class Section < Container
      attr_accessor :section_id

      def initialize(section_count, style = nil)
        @section_id = section_count
      end
    end
  end
end