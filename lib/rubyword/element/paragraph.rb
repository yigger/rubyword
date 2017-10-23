# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Paragraph < Base
      attr_accessor :paragraphs
      def text(text, style=nil)
        @paragraphs ||= []
        @paragraphs << {
          text: text,
          style: style
        }
      end

      def write(section=nil, xml=nil)
        @xml = xml
        @xml.send('w:p') { 
          @paragraphs.each do |p|
            # write_paragraph_style(text[:style])
            @xml.send('w:r') do
              # write_word_style(text[:style])
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