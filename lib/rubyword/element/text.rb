# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Text < Base
      attr_accessor :texts, :titles
      
      IndentSize = 200
      WordStyleList = {
        font_size: 'w:sz', # 字体大小
        color: 'w:color', # 字体颜色
        underline: 'w:u',  # 下划线
        blod: 'w:b', # 加粗
        all_caps: 'w:caps', # 转大写
        italic: 'w:i', # 斜体
        bgcolor: 'w:highlight', # 背景颜色
      }.freeze
      ParagraphStyleList = {
        text_align: 'w:jc',
        spacing: 'w:spacing', # Spacing between paragraphs and between lines of a paragaph is defined with the <w:spacing> element.
        indent_left: 'w:ind',
        indent_right: 'w:ind',
        indent_between: 'w:ind',
      }.freeze

      def save(text, type, style)
        @texts ||= Queue.new
        @titles ||= []
        return if text.nil?
        if type == 'text'
          text(text, style)
        else
          self.send(type.to_sym, text, style)
        end
      end

      def text(text, style)
        @texts << { size: 'normal', text: text.to_s, style: style }
      end

      (1..4).each do |num|
        define_method "title_#{num}" do |text, style|
          @rubyword.relation_rids << {rid: @rubyword.init_rid, type: "title_#{num}"}
          title_hs = {
            indent: (num - 1) * IndentSize,
            size: "title_#{num}",
            text: text.to_s,
            rid: @rubyword.init_rid,
            style: style
          }
          @titles << title_hs if (style && !style[:ignore_dir]) || style.nil?
          @texts << title_hs
          @rubyword.init_rid = @rubyword.init_rid + 1
        end

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

      def write(section=nil, xml=nil)
        @xml = xml
        text = self.texts.pop
        eval "write_#{text[:size]}(text)"
      end

      def write_normal(text)
        @xml.send('w:p') do
          write_paragraph_style(text[:style])
          @xml.send('w:r') do
            write_word_style(text[:style])
            @xml.send('w:t', {'xml:space' => 'preserve'}, text[:text])
          end
        end
      end

      def write_word_style(style)
        if style.is_a?(Hash)
          @xml.send('w:rPr') {
            style.keys.each do |style_name|
              style_name = style_name.to_sym
              if WordStyleList.keys.include?(style_name)
                value =style[style_name]
                attribute = if !!value != value # not a bool type
                              {'w:val' => value}
                            else
                              nil
                            end
                doc_style = WordStyleList[style_name]
                @xml.send(doc_style, attribute)
                @xml.send('w:szCs', attribute) if style_name == :font_size
              end
            end
          }
        end
      end
      
      def write_paragraph_style(style)
        return unless style.is_a?(Hash)
        @xml.send('w:pPr') {
          style.keys.each do |style_name|
            style_name = style_name.to_sym
            next unless ParagraphStyleList.keys.include?(style_name)
            value =style[style_name]
            attribute = case style_name.to_s
                        when 'spacing'
                          {'w:after' => value}
                        when 'indent_left'
                          {'w:left' => value}
                        when 'indent_right'
                          {'w:right' => value}
                        when 'indent_between'
                          v = value.split '-'
                          next unless v.is_a?(Array)
                          { 'w:left' => v[0].to_i, 'w:right' => v[1].to_i }
                        when !!value == value
                          nil
                        else
                          {'w:val' => value}
                        end
            doc_style = ParagraphStyleList[style_name]
            @xml.send(doc_style, attribute)
          end
        }
      end

    end
  end
end