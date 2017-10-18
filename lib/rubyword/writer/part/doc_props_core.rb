# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class DocPropsCore < Base
				def write
					xmlns = {
						'xmlns:cp' => 'http://schemas.openxmlformats.org/package/2006/metadata/core-properties',
						'xmlns:dc' => 'http://purl.org/dc/elements/1.1/',
						'xmlns:dcterms' => 'http://purl.org/dc/terms/',
						'xmlns:dcmitype' => 'http://purl.org/dc/dcmitype/',
						'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance'
          }
          infomartion = @rubyword.doc_info
					builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
            xml.send('cp:coreProperties', xmlns) do
              xml.send('dc:title', infomartion[:title])
              xml.send('dc:subject', infomartion[:subject])
							xml.send('dc:creator', infomartion[:creator])
              xml.send('cp:keywords', infomartion[:keywords])
							xml.send('dc:description', infomartion[:description])
							xml.send('cp:lastModifiedBy', 'rubyword')
              xml.send('cp:category', infomartion[:category])
							xml.send('dcterms:created', {'xsi:type' => 'dcterms:W3CDTF'}, Time.now.strftime('%Y-%m-%dT%H:%M:%SZ').to_s)
						end
					end
					builder.to_xml
				end
			end
		end
  end
end