# -*- encoding : utf-8 -*-
module Rubyword
	module Writer
		module Part
			class Settings < Base
				def write
					xmlns = {
						'xmlns:o' => 'urn:schemas-microsoft-com:office:office',
						'xmlns:r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
						'xmlns:m' => 'http://schemas.openxmlformats.org/officeDocument/2006/math',
						'xmlns:v' => 'urn:schemas-microsoft-com:vml',
						'xmlns:sl' => 'http://schemas.openxmlformats.org/schemaLibrary/2006/main',
						'xmlns:w10' => 'urn:schemas-microsoft-com:office:word',
						'xmlns:w' => 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
					}

					default_setting = {
						'w:zoom' => { 'w:percent' => '100'},
						'w:defaultTabStop' => {'w:val' => '708'},
						'w:hyphenationZone' => {'w:val' => '425'},
						'w:characterSpacingControl' => {'w:val' => 'doNotCompress'},
						'w:themeFontLang' => {'w:val' => 'en-US'},
						'w:decimalSymbol' => {'w:val' => '.'},
						'w:listSeparator' => {'w:val' => ';'}
					}
					
					default_math = {
						'm:mathPr' => {
							'm:mathFont' => {'m:val' => 'Cambria Math'},
							'm:brkBin' => {'m:val' => 'before'},
							'm:brkBinSub' => {'m:val' => '--'},
							'm:smallFrac' => {'m:val' => 'off'},
							'm:dispDef' => '',
							'm:lMargin' => {'m:val' => '0'},
							'm:rMargin' => {'m:val' => '0'},
							'm:defJc' => {'m:val' => 'centerGroup'},
							'm:wrapIndent' => {'m:val' => '1440'},
							'm:intLim' => {'m:val' => 'subSup'},
							'm:naryLim' => {'m:val' => 'undOvr'}
						}
					}

					default_scheme = {
						'w:clrSchemeMapping' => {
							'w:bg1' => 'light1',
							'w:t1' => 'dark1',
							'w:bg2' => 'light2',
							'w:t2' => 'dark2',
							'w:accent1' => 'accent1',
							'w:accent2' => 'accent2',
							'w:accent3' => 'accent3',
							'w:accent4' => 'accent4',
							'w:accent5' => 'accent5',
							'w:accent6' => 'accent6',
							'w:hyperlink' => 'hyperlink',
							'w:followedHyperlink' => 'followedHyperlink'
						}
					}

					builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
						xml.send('w:settings', xmlns) do
							default_setting.each do |key, value|
								xml.send(key, value)
							end

							# 需定制
							xml.send('w:compat') {
								xml.send('w:compatSetting', {
									'w:name' => 'compatibilityMode',
									'w:uri' => 'http://schemas.microsoft.com/office/word',
									'w:val' => 12
								})
							}

							default_math.each do |k, v|
								xml.send(k) {
									v.each do |sk, sv|
										xml.send(sk, sv)
									end
								}
							end

							default_scheme.each do |k, v|
								xml.send(k, v)
							end
						end
					end
					builder.to_xml
				end
			end
		end
  end
end