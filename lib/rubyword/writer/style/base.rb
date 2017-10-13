# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Style
      class Base
        attr_accessor :rubyword, :style, :section, :xml
        def initialize(section, xml, rubyword)
          @style = section.style
          @section = section
          @xml = xml
          @rubyword = rubyword
        end
      end
    end
  end
end