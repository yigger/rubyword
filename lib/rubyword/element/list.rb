# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class List < Base
      attr_accessor :lists

      # write document and numbering
      def save(text, level, style)
        @lists ||= Queue.new
        text = filter_text(text)
        @lists << {
          level: level.to_i - 1,
          text: text,
          style: style
        }
      end

      def write(section=nil, xml=nil)
        @xml = xml
        list = self.lists.pop
        @xml.send('w:p') {
          @xml.send('w:pPr') {
            @xml.send('w:numPr') {
              @xml.send('w:ilvl', 'w:val' => list[:level])
              @xml.send('w:numId', 'w:val' => 3)
            }
          }
          @xml.send('w:r') {
            Writer::Style::Word.new(@section, @xml, @rubyword).write(list[:style])
            @xml.send('w:t', {'xml:space' => 'preserve'}, list[:text])
          }
        }
      end

    end
  end
end