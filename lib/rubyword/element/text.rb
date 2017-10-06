# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    module Text

      def text(text)
        @texts.push(style: 'normal', text: text.to_s)
      end

      (1..4).each do |num|
        define_method "title_#{num}" do |args|
          @texts.push(style: "title_#{num}", text: args.to_s)
        end
      end
      
    end
  end
end