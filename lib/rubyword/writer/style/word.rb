# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Style
      class Word < Base
        WordStyleList = {
          font_size: 'w:sz',
          color: 'w:color',
          underline: 'w:u', 
          blod: 'w:b', 
          all_caps: 'w:caps',
          italic: 'w:i',
          bgcolor: 'w:highlight'
        }.freeze

        def write(style)
          if !style.nil? && style.is_a?(Hash)
            @xml.send('w:rPr') {
              style.keys.each do |style_name|
                style_name = style_name.to_sym
                if WordStyleList.keys.include?(style_name)
                  value = style[style_name]
                  attribute = if !!value != value # not a bool type
                                {'w:val' => value}
                              else
                                nil
                              end
                  doc_style = WordStyleList[style_name]
                  @xml.send(doc_style, attribute)
                  @xml.send('w:szCs', attribute) if style_name == :font_size
                end
              end
            }
          end
        end

      end
    end
  end
end