module Rubyword
  module Writer
    class RelsDocument < Base
      def write
				xmlRels = {
					'styles.xml'       => 'officeDocument/2006/relationships/styles',
					'numbering.xml'    => 'officeDocument/2006/relationships/numbering',
					'settings.xml'     => 'officeDocument/2006/relationships/settings',
					'theme/theme1.xml' => 'officeDocument/2006/relationships/theme',
					'webSettings.xml'  => 'officeDocument/2006/relationships/webSettings',
					'fontTable.xml'    => 'officeDocument/2006/relationships/fontTable',
				}
				builder = Nokogiri::XML::Builder.new do |xml|
					xml.Relationships(xmlns: 'http://schemas.openxmlformats.org/package/2006/relationships') do
						5.times.each do |num|
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