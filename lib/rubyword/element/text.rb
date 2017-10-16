# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Text < Base
      attr_accessor :texts, :titles
      IndentSize = 200

      def write_object(text, type, style)
        @texts ||= Queue.new
        @titles ||= []
        return if text.nil?
        if type == 'text'
          text(text, style)
        else
          self.send(type.to_sym, text, style)
        end
      end

      def text(text, style)
        @texts << { size: 'normal', text: text.to_s, style: style }
      end

      (1..4).each do |num|
        define_method "title_#{num}" do |text, style|
          @rubyword.relation_rids << {rid: @rubyword.init_rid, type: "title_#{num}"}
          title_hs = {
            indent: (num - 1) * IndentSize,
            size: "title_#{num}",
            text: text.to_s,
            rid: @rubyword.init_rid,
            style: style
          }
          @titles << title_hs if (style && !style[:ignore_dir]) || style.nil?
          @texts << title_hs
          @rubyword.init_rid = @rubyword.init_rid + 1
        end
      end

    end
  end
end