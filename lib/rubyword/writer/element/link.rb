# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class Link < Base
        
        def write
          return nil unless @section.e_link
          links = @section.e_link.links
          # link.each do |link|
          #   @xml.send('w:p') {
          #     @xml.send('hyperlink', 'r:id' => '', 'w:history' => '1') {
          #       @xml.send('w:r') {
          #         @xml.send('w:rPr')
          #         @xml.send('w:t', 'xml:space' => 'preserve', link[:text])
          #       }
          #     }
          #   }
          # end

        end
        
      end
    end
  end
end