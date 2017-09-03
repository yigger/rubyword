module Rubyword
  module Writer
    module Element
      class Base
        attr_accessor :section
        def initialize(section)
          @section = section 
        end
      end
    end
  end
end