# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Part
      class Styles < Base

        # font default setting
        DEFAULT_FONT_NAME = 'Arial'
        DEFAULT_FONT_SIZE = 10
        DEFAULT_FONT_COLOR = '000000'
        DEFAULT_FONT_CONTENT_TYPE = 'default'

        def title_style
          [
            {'size' => 20, 'color' => '333333', 'bold' => true},
            {'size' => 16, 'color' => '333333', 'bold' => true},
            {'size' => 14, 'color' => '333333', 'bold' => true},
            {'size' => 12, 'color' => '333333', 'bold' => true}
          ]
        end

        def write
          attribute = {
            'xmlns:w' => 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
            'xmlns:r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships'
          }
          builder = Nokogiri::XML::Builder.new do |xml|
						xml.send('w:styles', attribute) {
              default_setting(xml)
              normal_style(xml)
              footer_note_style(xml)
              write_font_style(xml)
            }
          end
          builder.to_xml
        end

        def default_setting(xml)
          xml.send('w:docDefaults') {
            xml.send('w:rPrDefault') {
              xml.send('w:rPr') {
                xml.send('w:rFonts', {'w:ascii'=>DEFAULT_FONT_NAME, 'w:hAnsi'=>DEFAULT_FONT_NAME, 'w:eastAsia'=>DEFAULT_FONT_NAME, 'w:cs'=>DEFAULT_FONT_NAME})
                xml.send('w:sz', 'w:val' => DEFAULT_FONT_SIZE * 2 )
                xml.send('w:szCs', 'w:val' => DEFAULT_FONT_SIZE * 2 )
              }
            }
          }
        end

        def normal_style(xml)
          attribute = {
            'w:type' => 'paragraph',
            'w:default' => 1,
            'w:styleId' => 'Normal'
          }
          xml.send('w:style', attribute) {
            xml.send('w:name', 'w:val' => 'Normal')
          }
        end
        
        def footer_note_style(xml)
          xml.send('w:style', {'w:type' => 'character', 'w:styleId' => 'FootnoteReference'}) {
            xml.send('w:name', 'w:val' => 'Footnote Reference')
            xml.send('w:semiHidden')
            xml.send('w:unhideWhenUsed')
            xml.send('w:rPr') {
              xml.send('w:verAlign', 'w:val' => 'superscript')
            }
          }
        end

        def write_font_style(xml)
          title_style.each_with_index do |style, index|
            index = index + 1
            xml.send('w:style', {'w:type' => 'paragraph', 'w:styleId' => "Heading#{index}"}) {
              xml.send('w:link', {'w:val' => "Heading#{index}Char"})
              xml.send('w:name', {'w:val' => "heading #{index}"})
              xml.send('w:rPr') {
                xml.send('w:color', 'w:val' => style['color'])
                xml.send('w:sz', 'w:val' => style['size'] * 2)
                xml.send('w:szCs', 'w:val' => style['size'] * 2)
                xml.send('w:b')
              }
            }
          end
        end

      end
    end
  end
end