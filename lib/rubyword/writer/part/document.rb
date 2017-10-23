# -*- encoding : utf-8 -*
module Rubyword
  module Writer
    module Part
      class Document < Base
        include Toc
        DOCUMENT_ATTR = {
          'xmlns:ve' => "http://schemas.openxmlformats.org/markup-compatibility/2006",
          'xmlns:o' => "urn:schemas-microsoft-com:office:office",
          'xmlns:r' => "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
          'xmlns:m' => "http://schemas.openxmlformats.org/officeDocument/2006/math",
          'xmlns:v' => "urn:schemas-microsoft-com:vml",
          'xmlns:wp' => "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
          'xmlns:w10' => "urn:schemas-microsoft-com:office:word",
          'xmlns:w' => "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
          'xmlns:wne' => "http://schemas.microsoft.com/office/word/2006/wordml"
        }

        def write
          builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
            xml.send('w:document', DOCUMENT_ATTR) {
              xml.send('w:body') {
                section_write(xml)
              }
            }
          end
          builder.to_xml
        end

        def section_write(xml)
          @object_blocks = []
          sections_count = @rubyword.sections.count
          current_section = 0
          # write TOC
          write_toc(@rubyword, xml)
          # To write all sections xml.
          @rubyword.sections.each do |section|
            current_section = current_section + 1
            section.objects.each{|object| 
              # text should save in block
              object.write(section, xml)
            }
            # write in the last
            if current_section == sections_count
              Style::Section.new(section, xml, @rubyword).write
            else
              xml.send('w:p') {
                xml.send('w:pPr') {
                  Style::Section.new(section, xml, @rubyword).write
                }
              }
            end
          end

        end
        
      end # end of class
    end
  end
end