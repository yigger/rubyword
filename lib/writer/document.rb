module Rubyword
  module Writer
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
        # puts @rubyword.sections.count

        # builder = Nokogiri::XML::Builder.new do |xml|
				# 	xml.Document(DOCUMENT_ATTR) {
        #     xml.send('w:body') {

        #     }
        #   }
				# end
				Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'document.xml'))).to_xml
      end

    end
  end
end