# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class ContentTypes < Base
				def write
					openXMLPrefix = 'application/vnd.openxmlformats-';
					wordMLPrefix  = "#{openXMLPrefix}officedocument.wordprocessingml";
					overrides = {
						'/docProps/core.xml' => "#{openXMLPrefix}package.core-properties+xml",
						'/docProps/app.xml' => "#{openXMLPrefix}officedocument.extended-properties+xml",
						'/docProps/custom.xml' => "#{openXMLPrefix}officedocument.custom-properties+xml",
						'/word/document.xml' => "#{wordMLPrefix}.document.main+xml",
						'/word/styles.xml' => "#{wordMLPrefix}.styles+xml",
						'/word/numbering.xml' => "#{wordMLPrefix}.numbering+xml",
						'/word/settings.xml' => "#{wordMLPrefix}.settings+xml",
						'/word/theme/theme1.xml' => "#{openXMLPrefix}officedocument.theme+xml",
						'/word/webSettings.xml' => "#{wordMLPrefix}.webSettings+xml",
						'/word/fontTable.xml' => "#{wordMLPrefix}.fontTable+xml"
					}
					@rubyword.content_types.each do |target|
						overrides.merge!(target)
					end
					builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
						xml.Types(xmlns: 'http://schemas.openxmlformats.org/package/2006/content-types') do
							xml.Default(Extension: 'rels', ContentType: "application/vnd.openxmlformats-package.relationships+xml")
							xml.Default(Extension: 'xml', ContentType: 'application/xml')
							xml.Default(Extension: 'jpg', ContentType: 'image/jpeg')
							overrides.each do |part_name, content_type|
								xml.Override(PartName: part_name, ContentType: content_type)
							end
						end
					end
					builder.to_xml
				end
			end
    end
  end
end