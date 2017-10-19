# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class PageBreak < Base
      attr_accessor :numbers
      
      def save(numbers)
        @numbers ||= Queue.new
        @numbers << numbers.to_i
      end

      def write(section=nil, xml=nil)
        @xml = xml
        page_break = self.numbers.pop
        page_break.to_i.times.each do |i|
          @xml.send('w:p') {
            @xml.send('w:r') {
              @xml.send('w:br', 'w:type' => 'page')
            }  
          }
        end
      end

    end
  end
end