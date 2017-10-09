# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Header < Base

      attr_accessor :header_text, :header_style

      def write_object(*args)
        header(args[0], args[1])
      end

      def header(text, header_style='center')
        @relation_rids.push({rid: @rubyword.init_rid, type: 'header'})
        @rubyword.init_rid = @rubyword.init_rid + 1
        @header_text = text
        # @header_style = @style.align_style.keys.include?(header_style.to_sym) ? header_style : 'center'
        @header_style = 'center'
      end

    end
  end
end