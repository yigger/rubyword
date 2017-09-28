# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Style
      class Base
        attr_accessor :style, :section
        def initialize(section)
          @style = section.style
          @section = section
        end
      end
    end
  end
end