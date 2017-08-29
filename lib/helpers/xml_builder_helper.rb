module Rubyword
  module XmlBuilderHelper
    class << self
			def content_types
				openXMLPrefix = 'application/vnd.openxmlformats-';
        wordMLPrefix  = "#{openXMLPrefix}officedocument.wordprocessingml";
        overrides = {
					'/docProps/core.xml' => "#{openXMLPrefix}package.core-properties+xml",
					'/docProps/app.xml' => "#{openXMLPrefix}officedocument.extended-properties+xml",
					'/docProps/custom.xml' => "#{openXMLPrefix}officedocument.custom-properties+xml",
					'/word/document.xml' => "#{wordMLPrefix }document.main+xml",
					'/word/styles.xml' => "#{wordMLPrefix }styles+xml",
					'/word/numbering.xml' => "#{wordMLPrefix }numbering+xml",
					'/word/settings.xml' => "#{wordMLPrefix }settings+xml",
					'/word/theme/theme1.xml' => "#{openXMLPrefix}officedocument.theme+xml",
					'/word/webSettings.xml' => "#{wordMLPrefix }webSettings+xml",
					'/word/fontTable.xml' => "#{wordMLPrefix }fontTable+xml"
				}
				
				builder = Nokogiri::XML::Builder.new do |xml|
					xml.Types(xmlns: 'http://schemas.openxmlformats.org/package/2006/content-types') do
						xml.Default(Extension: 'rels', ContentType: "application/vnd.openxmlformats-package.relationships+xml")
						xml.Default(Extension: 'xml', ContentType: 'application/xml')
						xml.Default(Extension: 'jpg', ContentType: 'image/jpeg')
						10.times.each do |time|
							xml.Override(PartName: overrides.keys[time], ContentType: overrides.values[time])
						end
					end
				end
				builder.to_xml
			end

			def doc_props_app
				builder = Nokogiri::XML::Builder.new do |xml|
					xml.Properties(xmlns: 'http://schemas.openxmlformats.org/officeDocument/2006/extended-properties', 
												 'xmlns:vt' => 'http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes') do
						xml.Company 'young'
						xml.Manager 'young'
					end
				end
				builder.to_xml
			end

			def doc_props_core
				
			end

			def rels_document
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

			def rels
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

			def numbering
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

			def styles
				'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
				<w:styles
						xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
						xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
						<w:docDefaults>
								<w:rPrDefault>
										<w:rPr>
												<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:eastAsia="Arial" w:cs="Arial"/>
												<w:sz w:val="20"/>
												<w:szCs w:val="20"/>
										</w:rPr>
								</w:rPrDefault>
						</w:docDefaults>
						<w:style w:type="paragraph" w:default="1" w:styleId="Normal">
								<w:name w:val="Normal"/>
						</w:style>
						<w:style w:type="character" w:styleId="FootnoteReference">
								<w:name w:val="Footnote Reference"/>
								<w:semiHidden/>
								<w:unhideWhenUsed/>
								<w:rPr>
										<w:vertAlign w:val="superscript"/>
								</w:rPr>
						</w:style>
						<w:style w:type="character">
								<w:name w:val="rStyle"/>
								<w:rPr>
										<w:sz w:val="32"/>
										<w:szCs w:val="32"/>
										<w:b/>
										<w:i/>
										<w:iCs/>
										<w:dstrike/>
										<w:caps/>
								</w:rPr>
						</w:style>
						<w:style w:type="paragraph" w:customStyle="1" w:styleId="pStyle">
								<w:name w:val="pStyle"/>
								<w:basedOn w:val="Normal"/>
								<w:
				pPr>
										<w:jc w:val="center"/>
										<w:spacing w:after="100"/>
								</w:pPr>
						</w:style>
						<w:style w:type="paragraph" w:styleId="Head
				ing1">
								<w:link w:val="Heading1Char"/>
								<w:name w:val="heading 1"/>
								<w:basedOn w:val="Normal"/>
								<w:pPr>
										<w:spacing w:aft
				er="240"/>
								</w:pPr>
								<w:rPr>
										<w:b/>
								</w:rPr>
						</w:style>
				</w:styles>'
			end
			
			def settings
				'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
				<w:settings
						xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
						xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
						xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/ma
				th"
						xmlns:sl="http://schemas.openxmlformats.org/schemaLibrary/2006/main"
						xmlns:o="urn:schemas-microsoft-com:offic
				e:office"
						xmlns:v="urn:schemas-microsoft-com:vml"
						xmlns:w10="urn:schemas-microsoft-com:office:word">
						<w:zoom w:percent="100"/>
						<w:defaultTabStop w:val="708"/>
						<w:hyphenationZone w:val="425"/>
						<w:characterSpacingControl w:val="doNotCompress"/>
						<w:themeFontLang w:val="en-US"/>
						<w:decimalSymbol w:val="."/>
						<w:listSeparator w:val=";"/>
						<w:compat>
								<w:compatSetting w:name="compatibilityMode" w:uri="http://schemas.microsoft.com/office/word" w:val="12"/>
						</w:compat>
						<m:mathPr>
								<m:mathFont m:val="Cambria Math"/>
								<m:brkBin m:val="before"/>
								<m:brkBinSub m:val="--"/>
								<m:smallFrac m:val="off"/>
								<m:dispDef/>
								<m:lMargin m:val="0"/>
								<m:rMargin m:val="0"/>
								<m:defJc m:val="centerGroup"/>
								<m:wrapIndent m:val="1440"/>
								<m:intLim m:val="subSup"/>
								<m:naryLim m:val="undOvr"/>
						</m:mathPr>
						<w:clrSchemeMapping w:bg1="light1" w:t1="dark1" w:bg2="light2" w:t2="dark2" w:accent1="accent1" w:accent2="accent2" w:accent3="accent3" w:accent4="accent4" w:accent5="accent5" w:accent6="accent6" w:hyperlink="hyperlink" w:followedHyperlink="followedHyperlink"/>
				</w:settings>'
			end

			def web_settings
				'<?xml version="1.0" encoding="UTF-8" standalone="yes"?><w:webSettings xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:optimizeForBrowser/></w:webSettings>'
			end
			
			def font_table
				'<?xml version="1.0" encoding="UTF-8" standalone="yes"?><w:fonts xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:font w:name="Times New Roman"><w:panose1 w:val="02020603050405020304" /><w:charset w:val="00" /><w:family w:val="roman" /><w:pitch w:val="variable" /><w:sig w:usb0="E0002AFF" w:usb1="C0007841" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000" /></w:font><w:font w:name="Courier New"><w:panose1 w:val="02070309020205020404" /><w:charset w:val="00" /><w:family w:val="modern" /><w:pitch w:val="fixed" /><w:sig w:usb0="E0002AFF"w:usb1="C0007843" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000" /></w:font><w:font w:name="Wingdings"><w:panose1 w:val="05000000000000000000" /><w:charset w:val="02" /><w:family w:val="auto" /><w:pitch w:val="variable" /><w:sig w:usb0="00000000" w:usb1="10000000" w:usb2="00000000" w:usb3="00000000" w:csb0="80000000" w:csb1="00000000" /></w:font><w:font w:name="Symbol"><w:panose1 w:val="05050102010706020507" /><w:charset w:val="02" /><w:family w:val="roman" /><w:pitch w:val="variable" /><w:sig w:usb0="00000000" w:usb1="10000000" w:usb2="00000000" w:usb3="00000000" w:csb0="80000000" w:csb1="00000000" /></w:font><w:font w:name="Arial"><w:panose1 w:val="020B0604020202020204" /><w:charset w:val="00" /><w:family w:val="swiss" /><w:pitch w:val="variable" /><w:sig w:usb0="E0002AFF" w:usb1="C0007843" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000" /></w:font><w:font w:name="Cambria"><w:panose1 w:val="02040503050406030204" /><w:charset w:val="00" /><w:family w:val="roman" /><w:pitch w:val="variable" /><w:sig w:usb0="A00002EF" w:usb1="4000004B" w:usb2="00000000" w:usb3="00000000" w:csb0="0000019F" w:csb1="00000000" /></w:font><w:font w:name="Calibri"><w:panose1 w:val="020F0502020204030204" /><w:charset w:val="00" /><w:family w:val="swiss" /><w:pitch w:val="variable" /><w:sig w:usb0="E10002FF" w:usb1="4000ACFF" w:usb2="00000009" w:usb3="00000000" w:csb0="0000019F" w:csb1="00000000" /></w:font></w:fonts>'
			end

			def theme
				'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
				<a:theme
						xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="Office Theme">
						<a:themeElements>
								<a:clrScheme name="Office">
										<a:dk1>
												<a:sysClr val="windowText"lastClr="000000" />
										</a:dk1>
										<a:lt1>
												<a:sysClr val="window" lastClr="FFFFFF" />
										</a:lt1>
										<a:dk2>
												<a:srgbClr val="1F497D" />
										</a:dk2>
										<a:lt2>
												<a:srgbClr val="EEECE1" />
										</a:lt2>
										<a:accent1>
												<a:srgbClr val="4F81BD" />
										</a:accent1>
										<a:accent2>
												<a:srgbClr val="C0504D" />
										</a:accent2>
										<a:accent3>
												<a:srgbClr val="9BBB59" />
										</a:accent3>
										<a:accent4>
												<a:srgbClr val="8064A2" />
										</a:accent4>
										<a:accent5>
												<a:srgbClr val="4BACC6" />
										</a:accent5>
										<a:accent6>
												<a:srgbClr val="F79646" />
										</a:accent6>
										<a:hlink>
												<a:srgbClr val="0000FF" />
										</a:hlink>
										<a:folHlink>
												<a:srgbClr val="800080" />
										</a:folHlink>
								</a:clrScheme>
								<a:fontScheme name="Office">
										<a:majorFont>
												<a:latin typeface="Cambria" />
												<a:ea typeface="" />
												<a:cs typeface="" />
												<a:font script="Jpan" typeface="ＭＳ ゴシック" />
												<a:font script="Hang" typeface="맑은 고딕" />
												<a:font script="Hans" typeface="宋体" />
												<a:font script="Hant" typeface="新細明體" />
												<a:font script="Arab" typeface="Times New Roman" />
												<a:font script="Hebr" typeface="Times New Roman" />
												<a:font script="Thai" typeface="Angsana New" />
												<a:font script="Ethi" typeface="Nyala" />
												<a:font script="Beng" typeface="Vrinda" />
												<a:font script="Gujr" typeface="Shruti" />
												<a:font script="Khmr" typeface="MoolBoran" />
												<a:font script="Knda" typeface="Tunga" />
												<a:font script="Guru" typeface="Raavi" />
												<a:font script="Cans" typeface="Euphemia" />
												<a:font script="Cher" typeface="Plantagenet Cherokee" />
												<a:font script="Yiii" typeface="Microsoft Yi Baiti" />
												<a:font script="Tibt" typeface="Microsoft Himalaya" />
												<a:font script="Thaa" typeface="MV Boli" />
												<a:font script="Deva" typeface="Mangal" />
												<a:font script="Telu" typeface="Gautami" />
												<a:font script="Taml" typeface="Latha" />
												<a:font script="Syrc" typeface="Estrangelo Edessa" />
												<a:font script="Orya" typeface="Kalinga" />
												<a:font script="Mlym" typeface="Kartika" />
												<a:font script="Laoo" typeface="DokChampa" />
												<a:font script="Sinh" typeface="Iskoola Pota" />
												<a:font script="Mong" typeface="Mongolian Baiti" />
												<a:font script="Viet" typeface="Times New Roman" />
												<a:font script="Uigh" typeface="Microsoft Uighur" />
										</a:majorFont>
										<a:minorFont>
												<a:latin typeface="Calibri" />
												<a:ea typeface="" />
												<a:cs typeface="" />
												<a:font script="Jpan" typeface="ＭＳ 明朝" />
												<a:font script="Hang" typeface="맑은 고딕" />
												<a:font script="Hans" typeface="宋体" />
												<a:font script="Hant" typeface="新細明體" />
												<a:font script="Arab" typeface="Arial" />
												<a:font script="Hebr" typeface="Arial" />
												<a:font script="Thai" typeface="Cordia New" />
												<a:font script="Ethi" typeface="Nyala" />
												<a:font script="Beng" typeface="Vrinda" />
												<a:font script="Gujr" typeface="Shruti" />
												<a:font script="Khmr" typeface="DaunPenh" />
												<a:fontscript="Knda" typeface="Tunga" />
												<a:font script="Guru" typeface="Raavi" />
												<a:font script="Cans" typeface="Euphemia" />
												<a:font script="Cher" typeface="Plantagenet Cherokee" />
												<a:font script="Yiii" typeface="Microsoft Yi Baiti"/>
												<a:font script="Tibt" typeface="Microsoft Himalaya" />
												<a:font script="Thaa" typeface="MV Boli" />
												<a:font script="Deva" typeface="Mangal" />
												<a:font script="Telu" typeface="Gautami" />
												<a:font script="Taml" typeface="Latha" />
												<a:font script="Syrc" typeface="Estrangelo Edessa" />
												<a:font script="Orya" typeface="Kalinga" />
												<a:font script="Mlym" typeface="Kartika" />
												<a:font script="Laoo" typeface="DokChampa" />
												<a:font script="Sinh" typeface="Iskoola Pota" />
												<a:font script="Mong" typeface="Mongolian Baiti" />
												<a:font script="Viet" typeface="Arial" />
												<a:font script="Uigh" typeface="Microsoft Uighur" />
										</a:minorFont>
								</a:fontScheme>
								<a:fmtScheme name="Office">
										<a:fillStyleLst>
												<a:solidFill>
														<a:schemeClr val="phClr" />
												</a:solidFill>
												<a:gradFill rotWithShape="1">
														<a:gsLst>
																<a:gs pos="0">
																		<a:schemeClr val="phClr">
																				<a:tint val="50000" />
																				<a:satMod val="300000" />
																		</a:schemeClr>
																</a:gs>
																<a:gs pos="35000">
																		<a:schemeClr val="phClr">
																				<a:tint val="37000" />
																				<a:satMod val="300000" />
																		</a:schemeClr>
																</a:gs>
																<a:gs pos="100000">
																		<a:schemeClr val="phClr">
																				<a:tint val="15000" />
																				<a:satMod val="350000" />
																		</a:schemeClr>
																</a:gs>
														</a:gsLst>
														<a:lin ang="16200000" scaled="1" />
												</a:gradFill>
												<a:gradFill rotWithShape="1">
														<a:gsLst>
																<a:gs pos="0">
																		<a:schemeClr val="phClr">
																				<a:shade val="51000" />
																				<a:satMod val="130000" />
																		</a:schemeClr>
																</a:gs>
																<a:gs pos="80000">
																		<a:schemeClr val="phClr">
																				<a:shade val="93000" />
																				<a:satMod val="130000" />
																		</a:schemeClr>
																</a:gs>
																<a:gs pos="100000">
																		<a:schemeClr val="phClr">
																				<a:shade val="94000" />
																				<a:satMod val="135000" />
																		</a:schemeClr>
																</a:gs>
														</a:gsLst>
														<a:lin ang="16200000" scaled="0" />
												</a:gradFill>
										</a:fillStyleLst>
										<a:lnStyleLst>
												<a:ln w="9525" cap="flat" cmpd="sng" algn="ctr">
														<a:solidFill>
																<a:schemeClr val="phClr">
																		<a:shade val="95000" />
																		<a:satMod val="105000" />
																</a:schemeClr>
														</a:solidFill>
														<a:prstDash val="solid" />
												</a:ln>
												<a:ln w="25400" cap="flat" cmpd="sng" algn="ctr">
														<a:solidFill>
																<a:schemeClr val="phClr" />
														</a:solidFill>
														<a:prstDash val="solid" />
												</a:ln>
												<a:ln w="38100" cap="flat" cmpd="sng" algn="ctr">
														<a:solidFill>
																<a:schemeClr val="phClr" />
														</a:solidFill>
														<a:prstDash val="solid" />
												</a:ln>
										</a:lnStyleLst>
										<a:effectStyleLst>
												<a:effectStyle>
														<a:effectLst>
																<a:outerShdw blurRad="40000" dist="20000" dir="5400000" rotWithShape="0">
																		<a:srgbClr val="000000">
																				<a:alpha val="38000" />
																		</a:srgbClr>
																</a:outerShdw>
														</a:effectLst>
												</a:effectStyle>
												<a:effectStyle>
														<a:effectLst>
																<a:outerShdw blurRad="40000" dist="23000" dir="5400000" rotWithShape="0">
																		<a:srgbClr val="000000">
																				<a:alpha val="35000" />
																		</a:srgbClr>
																</a:outerShdw>
														</a:effectLst>
												</a:effectStyle>
												<a:effectStyle>
														<a:effectLst>
																<a:outerShdw blurRad="40000" dist="23000" dir="5400000" rotWithShape="0">
																		<a:srgbClr val="000000">
																				<a:alpha val="35000" />
																		</a:srgbClr>
																</a:outerShdw>
														</a:effectLst>
														<a:scene3d>
																<a:camera prst="orthographicFront">
																		<a:rot lat="0" lon="0" rev="0" />
																</a:camera>
																<a:lightRig rig="threePt"dir="t">
																		<a:rot lat="0" lon="0" rev="1200000" />
																</a:lightRig>
														</a:scene3d>
														<a:sp3d>
																<a:bevelT w="63500" h="25400" />
														</a:sp3d>
												</a:effectStyle>
										</a:effectStyleLst>
										<a:bgFillStyleLst>
												<a:solidFill>
														<a:schemeClr val="phClr" />
												</a:solidFill>
												<a:gradFill rotWithShape="1">
														<a:gsLst>
																<a:gs pos="0">
																		<a:schemeClr val="phClr">
																				<a:tint val="40000" />
																				<a:satMod val="350000" />
																		</a:schemeClr>
																</a:gs>
																<a:gs pos="40000">
																		<a:schemeClr val="phClr">
																				<a:tint val="45000" />
																				<a:shade val="99000" />
																				<a:satMod val="350000" />
																		</a:schemeClr>
																</a:gs>
																<a:gs pos="100000">
																		<a:schemeClr val="phClr">
																				<a:shade val="20000" />
																				<a:satMod val="255000" />
																		</a:schemeClr>
																</a:gs>
														</a:gsLst>
														<a:path path="circle">
																<a:fillToRect l="50000" t="-80000" r="50000" b="180000" />
														</a:path>
												</a:gradFill>
												<a:gradFill rotWithShape="1">
														<a:gsLst>
																<a:gs pos="0">
																		<a:schemeClr val="phClr">
																				<a:tint val="80000" />
																				<a:satMod val="300000" />
																		</a:schemeClr>
																</a:gs>
																<a:gs pos="100000">
																		<a:schemeClr val="phClr">
																				<a:shade val="30000" />
																				<a:satMod val="200000" />
																		</a:schemeClr>
																</a:gs>
														</a:gsLst>
														<a:path path="circle">
																<a:fillToRect l="50000" t="50000" r="50000" b="50000" />
														</a:path>
												</a:gradFill>
										</a:bgFillStyleLst>
								</a:fmtScheme>
						</a:themeElements>
						<a:objectDefaults />
						<a:extraClrSchemeLst />
				</a:theme>'
			end
		end
  end
end