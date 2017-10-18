# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class List < Base
      attr_accessor :lists

      # write document and numbering
      def write_object(text, level, style)
        @lists ||= Queue.new
        @lists << {
          level: level.to_i - 1,
          text: text
        }
      end

    end
  end
end