# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class TextBreak < Base
        def write
          return nil unless @section.e_text_break
          text_break = @section.e_text_break.numbers.pop
          text_break.to_i.times.each do |i|
            @xml.send('w:p')
          end
        end
      end
    end
  end
end