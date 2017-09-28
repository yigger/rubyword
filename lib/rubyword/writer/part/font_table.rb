# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Part
      class FontTable < Base
        def write
          Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'fontTable.xml'))).to_xml
        end
      end
    end
  end
end