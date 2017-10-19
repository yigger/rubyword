# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Base

      attr_accessor :rubyword

      def initialize(rubyword)
        @rubyword = rubyword
        @init_rid = @rubyword.init_rid
      end

    end
  end
end