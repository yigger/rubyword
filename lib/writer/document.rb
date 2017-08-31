module Rubyword
  module Writer
    class Document < Base
      def write
				Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'document.xml'))).to_xml
			end
    end
  end
end