# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class Link < Base
        
        def write
          return nil unless @section.e_link
          link = @section.e_link.links.pop
          @xml.send('w:p') {
            @xml.send('hyperlink', 'r:id' => "rId#{link[:rId]}", 'w:history' => '1') {
              @xml.send('w:r') {
                # TODO: add style
                @xml.send('w:rPr')
                @xml.send('w:t', {'xml:space' => 'preserve'}, link[:text])
              }
            }
          }

        end
        
      end
    end
  end
end