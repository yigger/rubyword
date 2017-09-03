module Rubyword
	module Writer
		module Part
			class DocPropsCustom < Base
				def write
					# 需要定制
					builder = Nokogiri::XML::Builder.new do |xml|
						xml.Properties(xmlns: 'http://schemas.openxmlformats.org/officeDocument/2006/custom-properties', 'xmlns:vt' => 'http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes')
					end
					builder.to_xml
				end
			end
		end
  end
end