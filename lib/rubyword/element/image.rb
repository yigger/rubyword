# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Image < Base
      attr_accessor :images
      def save(url, style=nil)
        @images ||= Queue.new
        filename = url.split('/').last
        width, height = FastImage.size(url)
        image_params = {
          rid: @rubyword.init_rid,
          path: url,
          width: width,
          height: height,
          filename: filename
        }
        @images << image_params
        @rubyword.images << image_params
        @rubyword.rels_documents << {
          Id: "rId#{@rubyword.init_rid}",
          Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image',
          Target: "media/#{filename}"
        }
        @rubyword.init_rid = @rubyword.init_rid + 1
      end

      def write(section=nil, xml=nil)
        @xml = xml
        image = self.images.pop
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