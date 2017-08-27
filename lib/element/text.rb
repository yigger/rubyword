module Rubyword
  module Element
    class Text
      attr_accessor :text
      def initialize(text, font_style = nil)
        @text = text
      end
      
    end
  end
end