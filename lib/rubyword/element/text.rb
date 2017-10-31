module Rubyword
  module Element
    class Text < Base
      attr_accessor :texts
      # Toc indent size
      IndentSize = 200
      
      def save(text, type=nil, style=nil)
        @texts ||= Queue.new
        @section.titles ||= []
        return if text.nil? || type.nil?
        text = filter_text(text)
        if type == 'text'
          text(text, style)
        else
          self.send(type.to_sym, text, style)
        end
      end

      def text(text, style)
        @texts << { size: 'normal', text: text, style: style }
      end

      (1..4).each do |num|
        define_method "title_#{num}" do |text, style|
          @rubyword.relation_rids << {rid: @rubyword.init_rid, type: "title_#{num}"}
          title_info = {
            indent: (num - 1) * IndentSize,
            size: "title_#{num}",
            text: text.to_s,
            rid: @rubyword.init_rid,
            style: style
          }
          @section.titles << title_info if (style && !style[:ignore_dir]) || style.nil?
          @texts << title_info
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
        @xml, @section = xml, section
        text = self.texts.pop
        return if text.to_s.empty?
        eval "write_#{text[:size]}(text)"
      end

      def write_normal(text)
        @xml.send('w:p') {
          Writer::Style::Paragraph.new(@section, @xml, @rubyword).write(text[:style])
          @xml.send('w:r') do
            Writer::Style::Word.new(@section, @xml, @rubyword).write(text[:style])
            @xml.send('w:t', {'xml:space' => 'preserve'}, text[:text])
          end
        }
      end

    end
  end
end