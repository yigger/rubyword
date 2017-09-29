# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Part
      class Base
        attr_accessor :rubyword, :section
        
        def initialize(rubyword, section=nil)
          @rubyword, @section = rubyword, section
        end
      end
    end
  end
end