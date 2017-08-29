module Rubyword
  module XmlBuilderHelper
    class << self
			def content_types
				content = <<-STR
				<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
				<Types
						xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
						<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
						<Default Extension="xml" ContentType="application/xml"/>
						<Default Extension="jpg" ContentType="image/jpeg"/>
						<Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>
						<Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>
						<Override PartName="/docProps/custom.xml" ContentType="application/vnd.openxmlformats-officedocument.custom-properties+xml"/>
						<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
						<Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>
						<Override PartName="/word/numbering.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml"/>
						<Override PartName="/word/settings.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml"/>
						<Override PartName="/word/theme/theme1.xml" ContentType="application/vnd.openxmlformats-officedocument.theme+xml"/>
						<Override PartName="/word/webSettings.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml"/>
						<Override PartName="/word/fontTable.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml"/>
				</Types>
				STR
			end

			def doc_props_app
				content = <<-STR
				<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
				<Properties
						xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"
						xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
						<Application>PHPWord</Application>
						<Company></Company>
						<Manager></Manager>
				</Properties>
				STR
			end

			def doc_props_core
				content = <<-STR
				<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
				<cp:coreProperties
						xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"
						xmlns:dc="http://purl.org/dc/elements/1.1/"
						xmlns:dcterms="http://purl.org/dc/terms/"
						xmlns:dcmitype="http://purl.org/dc/dcmitype/"
						xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
						<dc:creator></dc:creator>
						<dc:title></dc:title>
						<dc:description></dc:description>
						<dc:subject></dc:subject>
						<cp:keywords></cp:keywords>
						<cp:category></cp:category>
						<cp:lastModifiedBy></cp:lastModifiedBy>
						<dcterms:created xsi:type="dcterms:W3CDTF">2017-08-29T09:36:13+00:00</dcterms:created>
						<dcterms:modified xsi:type="dcterms:W3CDTF">2017-08-29T09:36:13+00:00</dcterms:modified>
				</cp:coreProperties>
				STR
			end

			def doc_props_custom
				<<-STR
				<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
				<Properties
						xmlns="http://schemas.openxmlformats.org/officeDocument/2006/custom-properties"
						xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes"/>
				STR
			end

			# 这个需要定制
			def document
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
					<w:document
							xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006"
							xmlns:o="urn:schemas-microsoft-com:office:office"
							xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
							xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
							xmlns:v="urn:schemas-microsoft-com:vml"
							xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
							xmlns:w10="urn:schemas-microsoft-com:office:word"
							xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
							xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml">
							<w:body>
									<w:p>
											<w:pPr>
													<w:pStyle w:val="Heading1"/>
											</w:pPr>
											<w:bookmarkStart w:id="1" w:name="_Toc1"/>
											<w:r>
													<w:t>Welcome to PhpWord</w:t>
											</w:r>
											<w:bookmarkEnd w:id="1"/>
									</w:p>
									<w:p>
											<w:pPr/>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">Hello World!</w:t>
											</w:r>
									</w:p>
									<w:p/>
									<w:p/>
									<w:p>
											<w:pPr/>
											<w:r>
													<w:rPr>
															<w:rStyle w:val="rStyle"/>
													</w:rPr>
													<w:t xml:space="preserve">I am styled by a font style definition.</w:t>
											</w:r>
									</w:p>
									<w:p>
											<w:pPr>
													<w:pStyle w:val="pStyle"/>
											</w:pPr>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">I am styled by a paragraph style definition.</w:t>
											</w:r>
									</w:p>
									<w:p>
											<w:pPr>
													<w:pStyle w:val="pStyle"/>
											</w:pPr>
											<w:r>
													<w:rPr>
															<w:rStyle w:val="rStyle"/>
													</w:rPr>
													<w:t xml:space="preserve">I am styled by both font and paragraph style.</w:t>
											</w:r>
									</w:p>
									<w:p/>
									<w:p>
											<w:r>
													<w:rPr>
															<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:eastAsia="Times New Roman" w:cs="Times New Roman"/>
															<w:sz w:val="40"/>
															<w:szCs w:val="40"/>
													</w:rPr>
													<w:t xml:space="preserve">I am inline styled </w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">with </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:color w:val="996699"/>
													</w:rPr>
													<w:t xml:space="preserve">color</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:b/>
													</w:rPr>
													<w:t xml:space="preserve">bold</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:i/>
															<w:iCs/>
													</w:rPr>
													<w:t xml:space="preserve">italic</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:u w:val="dash"/>
													</w:rPr>
													<w:t xml:space="preserve">underline</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:strike/>
													</w:rPr>
													<w:t xml:space="preserve">strikethrough</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:dstrike/>
													</w:rPr>
													<w:t xml:space="preserve">doubleStrikethrough</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:vertAlign w:val="superscript"/>
													</w:rPr>
													<w:txml:space="preserve">superScript
													</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:vertAlign w:val="subscript"/>
													</w:rPr>
													<w:t xml:space="preserve">subScript</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:smallCaps/>
													</w:rPr>
													<w:t xml:space="preserve">smallCaps</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:caps/>
													</w:rPr>
													<w:t xml:space="preserve">allCaps</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:highlight w:val="yellow"/>
													</w:rPr>
													<w:t xml:space="preserve">fgColor</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:w w:val="200"/>
													</w:rPr>
													<w:t xml:space="preserve">scale</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:spacing w:val="120"/>
													</w:rPr>
													<w:t xml:space="preserve">spacing</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">, </w:t>
											</w:r>
											<w:r>
													<w:rPr>
															<w:kern w:val="20"/>
													</w:rPr>
													<w:t xml:space="preserve">kerning</w:t>
											</w:r>
											<w:r>
													<w:rPr/>
													<w:t xml:space="preserve">. </w:t>
											</w:r>
									</w:p>
									<w:p>
											<w:hyperlink r:id="rId7" w:history="1">
													<w:r>
															<w:t xml:space="preserve">PHPWord on GitHub</w:t>
													</w:r>
											</w:hyperlink>
									</w:p>
									<w:p/>
									<w:p>
											<w:pPr/>
											<w:r>
													<w:pict>
															<v:shape type="#_x0000_t75" style="width:18px; height:18px; margin-left:0px; margin-top:0px; mso-position-horizontal:left;mso-position-vertical:top; mso-position-horizontal-relative:char; mso-position-vertical-relative:line;">
																	<w10:wrap type="inline"/>
																	<v:imagedata r:id="rId8" o:title=""/>
															</v:shape>
													</w:pict>
											</w:r>
									</w:p>
									<w:sectPr>
											<w:pgSz w:orient="portrait" w:w="11870" w:h="16787"/>
											<w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440" w:header="720" w:footer="720" w:gutter="0"/>
											<w:cols w:num="1" w:space="720"/>
									</w:sectPr>
							</w:body>
					</w:document>
				STR
			end

			def rels_document
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
					<Relationships
							xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
							<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
							<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering" Target="numbering.xml"/>
							<Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings"Target="settings.xml"/>
							<Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="theme/theme1.xml"/>
							<Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/webSettings" Target="webSettings.xml"/>
							<Relationship Id="rId6" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable" Target="fontTable.xml"/>
							<Relationship Id="rId7" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="https://github.com/PHPOffice/PHPWord" TargetMode="External"/>
							<Relationship Id="rId8" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/section_image1.jpg"/>
					</Relationships>
				STR
			end

			def rels
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
					<Relationships
							xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
							<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>
							<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>
							<Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/custom-properties" Target="docProps/custom.xml"/>
							<Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
				STR
			end

			def numbering
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
					<w:numbering
							xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006"
							xmlns:o="urn:schemas-microsoft-com:office:office"
							xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
							xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
							xmlns:v="urn:schemas-microsoft-com:vml"
							xmlns:wp="http://s
					chemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
							xmlns:w10="urn:schemas-microsoft-com:office:word"
							xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
							xmlns:wne="http://schemas.microsoft.com/o
					ffice/word/2006/wordml"/>
				STR
			end

			def styles
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
					</w:styles>
				STR
			end
			
			def settings
				content = <<-STR
				<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
				</w:settings>
				STR
			end

			def web_settings
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
					<w:webSettings xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:optimizeForBrowser/></w:webSettings>
				STR
			end
			
			def font_table
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?><w:fonts xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:font w:name="Times New Roman"><w:panose1 w:val="02020603050405020304" /><w:charset w:val="00" /><w:family w:val="roman" /><w:pitch w:val="variable" /><w:sig w:usb0="E0002AFF" w:usb1="C0007841" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000" /></w:font><w:font w:name="Courier New"><w:panose1 w:val="02070309020205020404" /><w:charset w:val="00" /><w:family w:val="modern" /><w:pitch w:val="fixed" /><w:sig w:usb0="E0002AFF"w:usb1="C0007843" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000" /></w:font><w:font w:name="Wingdings"><w:panose1 w:val="05000000000000000000" /><w:charset w:val="02" /><w:family w:val="auto" /><w:pitch w:val="variable" /><w:sig w:usb0="00000000" w:usb1="10000000" w:usb2="00000000" w:usb3="00000000" w:csb0="80000000" w:csb1="00000000" /></w:font><w:font w:name="Symbol"><w:panose1 w:val="05050102010706020507" /><w:charset w:val="02" /><w:family w:val="roman" /><w:pitch w:val="variable" /><w:sig w:usb0="00000000" w:usb1="10000000" w:usb2="00000000" w:usb3="00000000" w:csb0="80000000" w:csb1="00000000" /></w:font><w:font w:name="Arial"><w:panose1 w:val="020B0604020202020204" /><w:charset w:val="00" /><w:family w:val="swiss" /><w:pitch w:val="variable" /><w:sig w:usb0="E0002AFF" w:usb1="C0007843" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000" /></w:font><w:font w:name="Cambria"><w:panose1 w:val="02040503050406030204" /><w:charset w:val="00" /><w:family w:val="roman" /><w:pitch w:val="variable" /><w:sig w:usb0="A00002EF" w:usb1="4000004B" w:usb2="00000000" w:usb3="00000000" w:csb0="0000019F" w:csb1="00000000" /></w:font><w:font w:name="Calibri"><w:panose1 w:val="020F0502020204030204" /><w:charset w:val="00" /><w:family w:val="swiss" /><w:pitch w:val="variable" /><w:sig w:usb0="E10002FF" w:usb1="4000ACFF" w:usb2="00000009" w:usb3="00000000" w:csb0="0000019F" w:csb1="00000000" /></w:font></w:fonts>
				STR
			end

			def theme
				content = <<-STR
					<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
					</a:theme>
				STR
			end
		end
  end
end