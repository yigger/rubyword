module Rubyword
  module Writer
    module Style
      class Base
        attr_accessor :style
        def initialize(style)
          @style = style
        end
      end
    end
  end
end