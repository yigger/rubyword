# -*- encoding : utf-8 -*-
module Rubyword
    module Element
      class Link < Base
        attr_accessor :links
        def save(text, link, style=nil)
					@links ||= Queue.new
          return if text.nil?
          text = filter_text(text)
					@rubyword.rels_documents << {
						Id: "rId#{@rubyword.init_rid}",
						Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink',
						Target: link,
						TargetMode: 'External'
					}
					@links << { rId: @rubyword.init_rid, text: text, link: link, style: style }
					@rubyword.init_rid = @rubyword.init_rid + 1
        end
				
				def write(section=nil, xml=nil)
					@xml = xml
          link = self.links.pop
          @xml.send('w:p') {
            @xml.send('hyperlink', 'r:id' => "rId#{link[:rId]}", 'w:history' => '1') {
              @xml.send('w:r') {
                Writer::Style::Word.new(@section, @xml, @rubyword).write(link[:style])
                @xml.send('w:t', {'xml:space' => 'preserve'}, link[:text])
              }
            }
          }
				end
				
      end
    end
  end