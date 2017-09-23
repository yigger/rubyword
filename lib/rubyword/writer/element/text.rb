module Rubyword
  module Writer
    module Element
      class Text < Base
        def write
          puts @section.text
        end
      end
    end
  end
end