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
				xmlns = {
				  'xmlns:cp' => 'http://schemas.openxmlformats.org/package/2006/metadata/core-properties',
				  'xmlns:dc' => 'http://purl.org/dc/elements/1.1/',
				  'xmlns:dcterms' => 'http://purl.org/dc/terms/',
				  'xmlns:dcmitype' => 'http://purl.org/dc/dcmitype/',
				  'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance'
				}
				builder = Nokogiri::XML::Builder.new do |xml|
					xml.send('cp:coreProperties', xmlns) do
						xml.send('dc:creator', '')
						xml.send('dc:title', '')
						xml.send('dc:description', '')
						xml.send('dc:subject', '')
						xml.send('cp:keywords', '')
						xml.send('cp:category', '')
						xml.send('cp:lastModifiedBy', '')
						xml.send('dcterms:created', {'xsi:type' => 'dcterms:W3CDTF'}, '2017-08-29T09:48:45+00:00')
						xml.send('dcterms:modified', {'xsi:type' => 'dcterms:W3CDTF'}, '2017-08-29T09:48:45+00:00')
					end
				end
				builder.to_xml
			end

			def doc_props_custom
				<<-STR
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/custom-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes"/>
				STR
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

			def document
				<<-STR
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"><w:body><w:p><w:pPr><w:pStyle w:val="Heading1"/></w:pPr><w:bookmarkStart w:id="1" w:name="_Toc1"/><w:r><w:t>Welcome to PhpWord</w:t></w:r><w:bookmarkEnd w:id="1"/></w:p><w:p><w:pPr/><w:r><w:rPr/><w:t xml:space="preserve">Hello World!</w:t></w:r></w:p><w:p/><w:p/><w:p><w:pPr/><w:r><w:rPr><w:rStyle w:val="rStyle"/></w:rPr><w:t xml:space="preserve">I am styled by a font style definition.</w:t></w:r></w:p><w:p><w:pPr><w:pStyle w:val="pStyle"/></w:pPr><w:r><w:rPr/><w:t xml:space="preserve">I am styled by a paragraph style definition.</w:t></w:r></w:p><w:p><w:pPr><w:pStyle w:val="pStyle"/></w:pPr><w:r><w:rPr><w:rStyle w:val="rStyle"/></w:rPr><w:t xml:space="preserve">I am styled by both font and paragraph style.</w:t></w:r></w:p><w:p/><w:p><w:r><w:rPr><w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:eastAsia="Times New Roman" w:cs="Times New Roman"/><w:sz w:val="40"/><w:szCs w:val="40"/></w:rPr><w:t xml:space="preserve">I am inline styled </w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">with </w:t></w:r><w:r><w:rPr><w:color w:val="996699"/></w:rPr><w:t xml:space="preserve">color</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:b/></w:rPr><w:t xml:space="preserve">bold</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:i/><w:iCs/></w:rPr><w:t xml:space="preserve">italic</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:u w:val="dash"/></w:rPr><w:t xml:space="preserve">underline</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:strike/></w:rPr><w:t xml:space="preserve">strikethrough</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:dstrike/></w:rPr><w:t xml:space="preserve">doubleStrikethrough</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:vertAlign w:val="superscript"/></w:rPr><w:t xml:space="preserve">superScript</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:vertAlign w:val="subscript"/></w:rPr><w:t xml:space="preserve">subScript</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:smallCaps/></w:rPr><w:t xml:space="preserve">smallCaps</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:caps/></w:rPr><w:t xml:space="preserve">allCaps</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:highlight w:val="yellow"/></w:rPr><w:t xml:space="preserve">fgColor</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:w w:val="200"/></w:rPr><w:t xml:space="preserve">scale</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:spacing w:val="120"/></w:rPr><w:t xml:space="preserve">spacing</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">, </w:t></w:r><w:r><w:rPr><w:kern w:val="20"/></w:rPr><w:t xml:space="preserve">kerning</w:t></w:r><w:r><w:rPr/><w:t xml:space="preserve">. </w:t></w:r></w:p><w:p><w:hyperlink r:id="rId7" w:history="1"><w:r><w:t xml:space="preserve">PHPWord on GitHub</w:t></w:r></w:hyperlink></w:p><w:p/><w:p><w:pPr/><w:r><w:pict><v:shape type="#_x0000_t75" style="width:18px; height:18px; margin-left:0px; margin-top:0px; mso-position-horizontal:left; mso-position-vertical:top; mso-position-horizontal-relative:char; mso-position-vertical-relative:line;"><w10:wrap type="inline"/><v:imagedata r:id="rId8" o:title=""/></v:shape></w:pict></w:r></w:p><w:sectPr><w:pgSz w:orient="portrait" w:w="11870" w:h="16787"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440" w:header="720" w:footer="720" w:gutter="0"/><w:cols w:num="1" w:space="720"/></w:sectPr></w:body></w:document>
				STR
			end

			def styles
				builder = Nokogiri::XML::Builder.new do |xml|
					xml.send('w:styles', 'xmlns:r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships', 'xmlns:w' => 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'){
						
					}
				end
				builder.to_xml
			end
			
			def settings
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

				builder = Nokogiri::XML::Builder.new do |xml|
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

			def web_settings
				webs = {
					'xmlns:r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
					'xmlns:w' => 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
				}
				builder = Nokogiri::XML::Builder.new do |xml|
					xml.send('w:webSettings', webs){
						xml.send('w:optimizeForBrowser')
					}
				end
				builder.to_xml
			end
			
			def font_table
				Nokogiri::XML(open(File.join(::Rubyword::WORD_TEMP_PATH, 'fontTable.xml')))
			end
		end
  end
end