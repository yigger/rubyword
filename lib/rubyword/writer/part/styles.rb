module Rubyword
  module Writer
    module Part
      class Styles < Base
        def write
          Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'styles.xml'))).to_xml
        end
      end
    end
  end
end