# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    module Header
      attr_accessor :header_text
      
      def header(text)
        @relation_rids.push({rid: @init_rid + 1, type: 'header'})
        @init_rid = @init_rid + 1
        @header_text = text
      end
    end
  end
end