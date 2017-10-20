# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Base
      attr_accessor :rubyword, :section
      def initialize(rubyword, section=nil)
        @rubyword = rubyword
        @section = section
      end

    end
  end
end