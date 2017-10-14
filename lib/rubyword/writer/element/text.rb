# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    class Element::Text < Element::Base
      StyleList = {
        font_size: 'w:sz', # 字体大小
        color: 'w:color', # 字体颜色
        underline: 'w:u',  # 下划线
        blod: 'w:b', # 加粗
        all_caps: 'w:caps', # 转大写
        italic: 'w:i' # 斜体
      }.freeze

      def write
        if @section.e_text
          @section.e_text.texts.each do |text|
            eval "write_#{text[:size]}(text)"
          end
        end
      end

      def write_normal(text)
        @xml.send('w:p') do
          @xml.send('w:r') do
            write_style(text[:style])
            @xml.send('w:t', {'xml:space' => 'preserve'}, text[:text])
          end
        end
      end
      
      (1..4).each do |num|
        define_method "write_title_#{num}" do |args|
          @xml.send('w:p') do
            @xml.send('w:pPr') {
              @xml.send('w:pStyle', 'w:val' => "Heading#{num}")
            }
            @xml.send('bookmarkStart', 'w:id' => args[:rid], 'w:name' => "_Toc#{args[:rid]}")
            @xml.send('w:r') {
              @xml.send('w:t', args[:text])
            }
            @xml.send('bookmarkEnd', 'w:id' => args[:rid])
          end
        end
      end

      def write_style(style)
        @xml.send('w:rPr') {
          if style.is_a?(Hash)
            style.keys.each do |style_name|
              style_name = style_name.to_sym
              # support styles
              next unless StyleList.keys.include?(style_name)
              value =style[style_name]
              attribute = if !!value != value # not a bool type
                            {'w:val' => value}
                          else
                            nil
                          end
              doc_style = StyleList[style_name]
              @xml.send(doc_style, attribute)
              @xml.send('w:szCs', attribute) if style_name == :font_size
            end
          end
        }
      end

    end
  end
end