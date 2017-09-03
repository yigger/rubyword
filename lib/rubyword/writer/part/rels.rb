module Rubyword
	module Writer
		module Part
			class Rels < Base
				def write
					xmlRels = {
						'docProps/core.xml'       => 'http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties',
						'docProps/app.xml'    => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties',
						'docProps/custom.xml'     => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/custom-properties',
						'word/document.xml' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument'
					}
					builder = Nokogiri::XML::Builder.new do |xml|
						xml.Relationships(xmlns: 'http://schemas.openxmlformats.org/package/2006/relationships') do
							3.times.each do |num|
								num = num + 1
								xml.Relationship(Id: "rId#{num}", Type: xmlRels.values[num], Target: xmlRels.keys[num])
							end
						end
					end
					builder.to_xml
				end
			end
		end
  end
end