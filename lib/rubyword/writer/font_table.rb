module Rubyword
  module Writer
    class FontTable < Base
      def write
				Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'fontTable.xml'))).to_xml
			end
    end
  end
end