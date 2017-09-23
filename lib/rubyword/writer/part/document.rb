module Rubyword
  module Writer
    module Part
      class Document < Base
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
          sections_count = @rubyword.sections.count
          current_section = 0
          if sections_count > 0
            @rubyword.sections.each do |section|
              current_section = current_section + 1
              section.instance_variables.each do |v|
                instance_name = v.to_s[1..-1].capitalize
                class_name = "Element::#{instance_name}"
                if eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)")
                  eval "#{class_name}.new(section).write"
                else
                  next
                end
              end
              
              if current_section == sections_count
                Style::Section.new(section.style).write
              else
                write_section(section)
              end
            end
          end


          # builder = Nokogiri::XML::Builder.new do |xml|
          # 	xml.Document(DOCUMENT_ATTR) {
          #     xml.send('w:body') {

          #     }
          #   }
          # end
          Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'document.xml'))).to_xml
        end


        def write_section(section)

        end

      end
    end
  end
end