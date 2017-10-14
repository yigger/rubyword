# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    class Element::Toc < Element::Base
      
      def write
        return if @rubyword.toc.nil? || !@rubyword.toc[:open]

        @rubyword.sections.each_with_index do |section, section_index|
          section.e_text.titles.each_with_index do |title, title_index|
            rid = title[:rid]
            indent = 0

            @xml.send('w:p') {
              @xml.send('w:pPr') {
                @xml.send('w:tabs') {
                  @xml.send('w:tab', 'w:val' => 'right', 'w:leader' => 'dot', 'w:pos' => '9062')
                }

                # According title size to set tab index, detail: rubyword/element/text.rb
                if title[:indent] > 0
                  @xml.send('w:ind', 'w:left' => title[:indent])
                end
              }
              
              # initailize in first loop
              if section_index == 0 && title_index == 0
                @xml.send('w:r') {
                  @xml.send('w:fldChar', 'w:fldCharType' => 'begin')
                }
    
                @xml.send('w:r') {
                  @xml.send('w:instrText', {'xml:space' => 'preserve'}, "TOC \\o 1-13 \\h \\z \\u") # What does '1-13' mean?
                }
                
                @xml.send('w:r') {
                  @xml.send('w:fldChar', 'w:fldCharType' => 'separate')
                }
              end

              @xml.send('w:hyperlink', 'w:anchor' => "_Toc#{rid}", 'w:history' => 1) {
                @xml.send('w:r') {
                  # add font style
                  if @rubyword.toc[:font_size]
                    @xml.send('w:rPr') {
                      @xml.send('w:sz', 'w:val' => @rubyword.toc[:font_size])
                      @xml.send('w:szCs', 'w:val' => @rubyword.toc[:font_size])
                    }
                  end
                  # add text
                  @xml.send('w:t', title[:text])
                }
  
                @xml.send('w:r') {
                  @xml.send('w:tab')
                }
  
                @xml.send('w:r') {
                  @xml.send('fldChar', 'w:fldCharType' => 'begin')
                }
  
                @xml.send('w:r') {
                  @xml.send('w:instrText', {'xml:space' => 'preserve'}, "PAGEREF _Toc#{rid} \\h")
                }
  
                @xml.send('w:r') {
                  @xml.send('w:fldChar', 'w:fldCharType' => 'end')
                }
              }
            }
          end
        end

        # end of fldchar
        @xml.send('w:p') {
          @xml.send('w:r') {
            @xml.send('w:fldChar', 'w:fldCharType' => 'end')
          }
        }
      end

      

    end
  end
end