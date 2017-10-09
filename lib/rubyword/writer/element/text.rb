# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    class Element::Text < Element::Base
      
      PUBLIC_METHOD = ['normal', 'title_1', 'title_2', 'title_3', 'title_4']

      def write
        if @section.e_text
          @section.e_text.texts.each do |text|
            eval "write_#{text[:style]}(text)"
          end
        end
      end

      def write_normal(text)
        @xml.send('w:p') do
          @xml.send('w:r') do
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

    end
  end
end