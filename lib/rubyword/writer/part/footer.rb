# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Part
      class Footer < Base
        ATTRIBUTE = {
          'xmlns:ve' => 'http://schemas.openxmlformats.org/markup-compatibility/2006',
          'xmlns:o' => 'urn:schemas-microsoft-com:office:office',
          'xmlns:r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
          'xmlns:m' => 'http://schemas.openxmlformats.org/officeDocument/2006/math',
          'xmlns:v' => 'urn:schemas-microsoft-com:vml',
          'xmlns:wp' => 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing',
          'xmlns:w10' => 'urn:schemas-microsoft-com:office:word',
          'xmlns:w' => 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
          'xmlns:wne' => 'http://schemas.microsoft.com/office/word/2006/wordml'
        }

        def write
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.send('w:ftr', ATTRIBUTE) {
              xml.p {

                if section.align_style
                  xml.send('w:pPr') {
                    xml.send('w:jc', 'w:val' => section.align_style)
                  }
                end

                xml.send('w:r') { xml.send('w:fldChar', {'w:fldCharType' => "begin"}) }
                xml.send('w:r') { xml.send('w:instrText', {'w:space' => "preserve"}, 'PAGE') }
                xml.send('w:r') { xml.send('w:fldChar', {'w:fldCharType' => "separate"}) }
                xml.send('w:r') { xml.send('w:fldChar', {'w:fldCharType' => "end"}) }
              }
            }
          end
          builder.to_xml
        end

      end
    end
  end
end