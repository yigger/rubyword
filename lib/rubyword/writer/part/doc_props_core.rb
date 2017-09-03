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
					builder = Nokogiri::XML::Builder.new do |xml|
						xml.send('cp:coreProperties', xmlns) do
							xml.send('dc:creator', '')
							xml.send('dc:title', '')
							xml.send('dc:description', '')
							xml.send('dc:subject', '')
							xml.send('cp:keywords', '')
							xml.send('cp:category', '')
							xml.send('cp:lastModifiedBy', '')
							xml.send('dcterms:created', {'xsi:type' => 'dcterms:W3CDTF'}, '2017-08-29T09:48:45+00:00')
							xml.send('dcterms:modified', {'xsi:type' => 'dcterms:W3CDTF'}, '2017-08-29T09:48:45+00:00')
						end
					end
					builder.to_xml
				end
			end
		end
  end
end