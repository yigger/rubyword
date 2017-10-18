# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class Image < Base
        def write
          return nil unless @section.e_image
          image = @section.e_image.images.pop
          @xml.send('w:p') {
            @xml.send('w:rPr', 'type' => '#_x0000_t75', 'style' => "width:113.38582677165px; height:113.38582677165px; margin-left:585.82677165354px; margin-top:58.582677165354px; position:absolute; mso-position-horizontal:right; mso-position-vertical:top; mso-position-horizontal-relative:page; mso-position-vertical-relative:page;")
            @xml.send('w:r') {
              @xml.send('w:pict') {
                @xml.send('v:shape') {
                  @xml.send('w10:wrap', 'title' => 'inline', 'anchorx' => 'page', 'anchory' => 'page')
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