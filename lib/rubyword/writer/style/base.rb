# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Style
      class Base
        attr_accessor :style, :section, :xml
        def initialize(section, xml)
          @style = section.style
          @section = section
          @xml = xml
        end
      end
    end
  end
end