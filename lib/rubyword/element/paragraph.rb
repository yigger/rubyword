# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Paragraph < Text
      attr_accessor :paragraphs, :style
      def initialize(rubyword, section=nil, style)
        super(rubyword, section)
        @style = style
      end
      
      def text(text, style=nil)
        @paragraphs ||= []
        text = filter_text(text)
        @paragraphs << {
          text: text,
          style: style
        }
      end

      def write(section=nil, xml=nil)
        @xml = xml
        @xml.send('w:p') { 
          @paragraphs.each do |p|
            Writer::Style::Paragraph.new(@section, @xml, @rubyword).write(p[:style])
            @xml.send('w:r') do
              Writer::Style::Word.new(@section, @xml, @rubyword).write(p[:style])
              @xml.send('w:t', {'xml:space' => 'preserve'}, p[:text])
            end
          end
        }
      end
      
      def method_missing(name, *arg)
        @section.send(name.to_sym, *arg)
      end
    end
  end
end