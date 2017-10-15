# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class DocPropsApp < Base
        def write
          infomartion = @rubyword.doc_info
					builder = Nokogiri::XML::Builder.new do |xml|
						xml.Properties(xmlns: 'http://schemas.openxmlformats.org/officeDocument/2006/extended-properties', 
													'xmlns:vt' => 'http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes') do
							xml.Company(@rubyword.doc_info[:company])
							xml.Manager(@rubyword.doc_info[:creator])
						end
					end
					builder.to_xml
				end
			end
		end
  end
end