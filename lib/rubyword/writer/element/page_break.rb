# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class PageBreak < Base
        def write
          return nil unless @section.e_page_break
          page_break = @section.e_page_break.numbers.pop
          page_break.to_i.times.each do |i|
            @xml.send('w:p') {
              @xml.send('w:r') {
                @xml.send('w:br', 'w:type' => 'page')
              }    
            }
          end
        end
      end
    end
  end
end