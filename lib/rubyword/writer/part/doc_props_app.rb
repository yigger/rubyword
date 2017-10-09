# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class DocPropsApp < Base
				def write
					builder = Nokogiri::XML::Builder.new do |xml|
						xml.Properties(xmlns: 'http://schemas.openxmlformats.org/officeDocument/2006/extended-properties', 
													'xmlns:vt' => 'http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes') do
							xml.Company 'ruby-word'
							xml.Manager 'ruby-word'
						end
					end
					builder.to_xml
				end
			end
		end
  end
end