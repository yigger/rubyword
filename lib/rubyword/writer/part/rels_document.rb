# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class RelsDocument < Base
				def write
					xmlRels = {
						'styles.xml'       => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles',
						'numbering.xml'    => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering',
						'settings.xml'     => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings',
						'theme/theme1.xml' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme',
						'webSettings.xml'  => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/webSettings',
						'fontTable.xml'    => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable',
					}
					builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
						xml.Relationships(xmlns: 'http://schemas.openxmlformats.org/package/2006/relationships') do
							xmlRels.keys.each_with_index do |rel_name, index|
								id = index + 1
								xml.Relationship(Id: "rId#{id}", Type: xmlRels[rel_name], Target: rel_name)
							end
							@rubyword.rels_documents.each do |attribute|
								xml.Relationship(attribute)
							end
						end
					end
					builder.to_xml
				end
			end
		end
  end
end