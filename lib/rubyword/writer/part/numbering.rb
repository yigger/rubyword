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
					builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
						xml.send('w:numbering', xmlns) {
							xml.send('w:abstractNum', 'w:abstractNumId' => 3) {
								xml.send('w:nsid', 'w:val' => '5E15211D')
								xml.send('w:multiLevelType', 'w:val' => 'multilevel')
								2.times.each do |index|
									num = index + 1
									left = num * 360
									xml.send('w:lvl', 'w:ilvl' => index) {
										xml.send('w:start', 'w:val' => 1)
										xml.send('w:numFmt', 'w:val' => 'decimal')
										xml.send('w:suff', 'w:val' => 'tab')
										xml.send('w:lvlText', 'w:val' => "%#{num}.")
										xml.send('w:pPr') {
											xml.send('w:tabs') {
												xml.send('w:tab', 'w:val' => 'num', 'w:pos' => 360)
											}
											xml.send('w:ind', 'w:left'=> left, 'w:hanging' => 360)
										}
									}
								end
							} # end of lvl style
							
							xml.send('w:num', 'w:numId' => 3) {
								xml.send('w:abstractNumId', 'w:val' => 3)
							}
						}
					end
					builder.to_xml
				end
			end
		end
  end
end