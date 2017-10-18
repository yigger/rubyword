# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class WebSettings < Base
				def write
					webs = {
						'xmlns:r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
						'xmlns:w' => 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
					}
					builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
						xml.send('w:webSettings', webs){
							xml.send('w:optimizeForBrowser')
						}
					end
					builder.to_xml
				end
			end
		end
  end
end