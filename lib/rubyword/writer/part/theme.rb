module Rubyword
  module Writer
    module Part
      class Theme < Base
        def write
          Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'theme.xml'))).to_xml
        end
      end
    end
  end
end