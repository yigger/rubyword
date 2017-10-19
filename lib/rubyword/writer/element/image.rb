# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class Image < Base
        def write
          return nil unless @section.e_image
          image = @section.e_image.images.pop
          @xml.send('w:p') {
            @xml.send('w:pPr')
            @xml.send('w:r') {
              @xml.send('w:pict') {
                @xml.send('v:shape', 'type' => '#_x0000_t75', 'style' => "width:#{image[:width]}px; height:#{image[:height]}px; margin-left:0px; margin-top:0px; mso-position-horizontal:left; mso-position-vertical:top; mso-position-horizontal-relative:char; mso-position-vertical-relative:line;") {
                  @xml.send('w10:wrap', 'type' => 'inline', 'anchorx' => 'page', 'anchory' => 'page')
                  @xml.send('v:imagedata', 'r:id' => "rId#{image[:rid]}", 'o:title' => '')
                }
              }
            }
          }
        end
      end
    end
  end
end