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
          footer = @rubyword.footer
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.send('w:ftr', ATTRIBUTE) {
              xml.p {
                if footer[:text_align]
                  xml.send('w:pPr') {
                    xml.send('w:jc', 'w:val' => footer[:text_align])
                  }
                end
                
                nums_type = footer[:nums_type].to_s.downcase
                if footer[:text].nil? || nums_type == 'roman' || nums_type == 'number'
                  text = 'PAGE'
                  text = 'PAGE \* ROMAN' if nums_type == 'roman'
                  xml.send('w:r') { xml.send('w:fldChar', {'w:fldCharType' => "begin"}) }
                  xml.send('w:r') { xml.send('w:instrText', {'w:space' => "preserve"}, text) }
                  xml.send('w:r') { xml.send('w:fldChar', {'w:fldCharType' => "separate"}) }
                  xml.send('w:r') { xml.send('w:fldChar', {'w:fldCharType' => "end"}) }
                else
                  text = footer[:text]
                  xml.send('w:r') { xml.send('w:t', {'w:space' => "preserve"}, text) }
                end
              }
            }
          end
          builder.to_xml
        end

      end
    end
  end
end