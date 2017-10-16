# -*- encoding : utf-8 -*-
module Rubyword
    module Element
      class Link < Base
        attr_accessor :links
  
        def write_object(text, style)
					@links ||= []
					return if text.nil?
					@relation_rids << {
						rid: @rubyword.init_rid,
						type: ""
					}
					@rubyword.init_rid = @rubyword.init_rid + 1
					
					@links << {
						text: text
					}
        end
  
      end
    end
  end