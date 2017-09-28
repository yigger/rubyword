# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    module Footer
      attr_accessor :page_format, :page_style
      
      def initialize
        @page_format = false
      end

      def pagination(page_style)
        @relation_rids.push({rid: @init_rid + 1, type: 'footer'})
        @page_style = page_style
      end
      
    end
  end
end