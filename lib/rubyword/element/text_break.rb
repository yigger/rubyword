# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class TextBreak < Base
      attr_accessor :numbers
      def save(numbers)
        @numbers ||= Queue.new
        @numbers << numbers.to_i
      end

      def write(section=nil, xml=nil)
        text_break = self.numbers.pop
        text_break.to_i.times.each do |i|
          xml.send('w:p')
        end
      end

    end
  end
end