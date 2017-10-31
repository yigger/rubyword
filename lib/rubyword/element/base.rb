# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Base
      attr_accessor :rubyword, :section
      def initialize(rubyword, section=nil)
        @rubyword = rubyword
        @section = section
      end

      # filter html special char
      def filter_text(text)
        text = text.to_s
        text.gsub('&', '&amp;')
        text.gsub('\'', '&#039;')
        text.gsub('"', '&quot;')
        text.gsub('<', '&lt;')
        text.gsub('>', '&gt;')
        text
      end

    end
  end
end