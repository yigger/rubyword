# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class List < Base
        def write
          return nil unless @section.e_list
          list = @section.e_list.lists.pop
          @xml.send('w:p') {
            @xml.send('w:pPr') {
              @xml.send('w:numPr') {
                @xml.send('w:ilvl', 'w:val' => list[:level])
                @xml.send('w:numId', 'w:val' => 3)
              }
            }
            @xml.send('w:r') {
              @xml.send('w:rPr')
              @xml.send('w:t', {'xml:space' => 'preserve'}, list[:text])
            }
          }

        end
      end
    end
  end
end