# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Text < Base
      attr_accessor :texts, :titles
      INDENT_SIZE = 200

      def write_object(text, type, style)
        @texts ||= []
        @titles ||= []
        return if text.nil?
        if type == 'text'
          text(text, style)
        else
          self.send(type.to_sym, text, style)
        end
      end

      def text(text, style)
        # TODO: style write, the same as title_1..4
        @texts << { size: 'normal', text: text.to_s }
      end

      (1..4).each do |num|
        define_method "title_#{num}" do |text, style|
          @relation_rids.push({rid: @rubyword.init_rid, type: "title_#{num}"})
          title_hs = {
            indent: (num - 1) * INDENT_SIZE,
            size: "title_#{num}",
            text: text.to_s,
            rid: @rubyword.init_rid
          }
          @titles << title_hs
          @texts << title_hs
          @rubyword.init_rid = @rubyword.init_rid + 1
        end
      end

    end
  end
end