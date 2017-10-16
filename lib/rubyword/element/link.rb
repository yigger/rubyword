# -*- encoding : utf-8 -*-
module Rubyword
    module Element
      class Link < Base
        attr_accessor :links
  
        def write_object(text, link, style)
					@links ||= Queue.new
					return if text.nil?
					@rubyword.rels_documents << {
						Id: "rId#{@rubyword.init_rid}",
						Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink',
						Target: link,
						TargetMode: 'External'
					}
					@links << { rId: @rubyword.init_rid, text: text, link: link }
					@rubyword.init_rid = @rubyword.init_rid + 1
        end
  
      end
    end
  end