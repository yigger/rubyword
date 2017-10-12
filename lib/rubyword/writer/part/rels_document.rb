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
					builder = Nokogiri::XML::Builder.new do |xml|
						xml.Relationships(xmlns: 'http://schemas.openxmlformats.org/package/2006/relationships') do
							RELS_RID.times.each do |num|
								id_num = num + 1
								xml.Relationship(Id: "rId#{id_num}", Type: xmlRels.values[num], Target: xmlRels.keys[num])
							end

							@rubyword.sections.each do |section|
								next unless section.relation_rids
								section.relation_rids.each do |target|
									next unless ['header', 'footer'].include?(target[:type].to_s)
									xml.Relationship(Id: "rId#{target[:rid]}", Type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/#{target[:type].to_s}", Target: "#{target[:type].to_s}#{section.section_id}.xml")
								end
							end
						end
					end
					builder.to_xml
				end
			end
		end
  end
end