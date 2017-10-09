# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Footer < Base

      attr_accessor :page_format, :align_style
      
      def write_object(*args)
        @page_format = false
        pagination
      end

      def pagination(align_style='center')
        @align_style = 'center'
        # @align_style = @style.align_style.keys.include?(align_style.to_sym) ? align_style : 'center'
        @relation_rids.push({rid: @rubyword.init_rid, type: 'footer'})
        @rubyword.init_rid = @rubyword.init_rid + 1
      end

    end
  end
end