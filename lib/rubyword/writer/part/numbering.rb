# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class Numbering < Base
				def write
					xmlns = {
						'xmlns:ve' => 'http://schemas.openxmlformats.org/markup-compatibility/2006',
						'xmlns:o' => 'urn:schemas-microsoft-com:office:office',
						'xmlns:r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
						'xmlns:m' => 'http://schemas.openxmlformats.org/officeDocument/2006/math',
						'xmlns:v' => 'urn:schemas-microsoft-com:vml',
						'xmlns:wp' => 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing',
						'xmlns:w10' => 'urn:schemas-microsoft-com:office:word',
						'xmlns:w' => 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
						'xmlns:wne' => 'http://schemas.microsoft.com/office/word/2006/wordml'
					}
					builder = Nokogiri::XML::Builder.new do |xml|
						xml.send('w:numbering', xmlns)
					end
					builder.to_xml
				end
			end
		end
  end
end