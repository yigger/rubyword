# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Part
      class Base
        attr_accessor :rubyword
        def initialize(rubyword)
          @rubyword = rubyword
        end
      end
    end
  end
end