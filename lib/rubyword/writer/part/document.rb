# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    class Part::Document < Part::Base
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
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.send('w:document', DOCUMENT_ATTR) {
            xml.send('w:body') {
              section_write(xml).each{|x| x}
            }
          }
        end
        builder.to_xml
      end


      def section_write(xml)
        @object_blocks = []
        sections_count = @rubyword.sections.count
        current_section = 0
        @rubyword.sections.each do |section|
          current_section = current_section + 1

          toc_block = Writer::Element::Toc.new(self, section, xml).write
          # @object_blocks.push(toc_block)

          text_block = Writer::Element::Text.new(self, section, xml).write
          @object_blocks.push(text_block)

          if current_section == sections_count
            @object_blocks.push(Style::Section.new(section, xml).write)
          else
            p_block = xml.send('w:p') {
              xml.send('w:pPr') {
                Style::Section.new(section, xml).write
              }
            }
            @object_blocks.push(p_block)
          end
        end
        
        @object_blocks
      end
      
    end # end of class
  end
end