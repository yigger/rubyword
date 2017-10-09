# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    class Element::Toc < Element::Base
      
      def write
        @section.e_text.texts.each do |text|
          next unless text[:style].include?('title') 

          rid = text[:rid]
          indent = 0

          @xml.send('w:p') {
            @xml.send('w:pPr') {
              @xml.send('w:tabs') {
                @xml.send('w:tab', 'w:val' => 'right', 'w:leader' => 'dot', 'w:pos' => '9062')
              }
            }

            @xml.send('w:r') {
              @xml.send('w:fldChar', 'w:fldCharType' => 'begin')
            }

            @xml.send('w:r') {
              @xml.send('w:instrText', {'xml:space' => 'preserve'}, 'TOC \o 1-9 \h \z \u')
            }
            
            @xml.send('w:r') {
              @xml.send('w:fldChar', 'w:fldCharType' => 'separate')
            }

            @xml.send('w:hyperlink', 'w:anchor' => "_Toc#{rid}", 'w:history' => 1) {
              @xml.send('w:r') {
                @xml.send('w:t', text[:text])
              }

              @xml.send('w:r') {
                @xml.send('w:tab')
              }

              @xml.send('w:r') {
                @xml.send('fldChar', 'w:fldCharType' => 'begin')
              }

              @xml.send('w:r') {
                @xml.send('w:instrText', {'xml:space' => 'preserve'}, "PAGEREF _Toc#{rid} \h")
              }

              @xml.send('w:r') {
                @xml.send('w:fldChar', 'w:fldCharType' => 'end')
              }
            }
          }
          
          @xml.send('w:p') {
            @xml.send('w:r') {
              @xml.send('w:fldChar', 'w:fldCharType' => 'end')
            }
          }
        end
      end

    end
  end
end