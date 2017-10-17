# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class PageBreak < Base
      attr_accessor :numbers
      def write_object(numbers)
        @numbers ||= Queue.new
        @numbers << numbers.to_i
      end

    end
  end
end