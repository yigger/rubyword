# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Style
      class Paragraph < Base

        ParagraphStyleList = {
          text_align: 'w:jc',
          spacing: 'w:spacing',
          indent_left: 'w:ind',
          indent_right: 'w:ind',
          indent_between: 'w:ind'
        }.freeze

        # write paragraph style
        def write(style)
          return unless !style.nil? && style.is_a?(Hash)
          @xml.send('w:pPr') {
            style.keys.each do |style_name|
              style_name = style_name.to_sym
              next unless ParagraphStyleList.keys.include?(style_name)
              value = style[style_name]
              attribute = case style_name.to_s
                          when 'spacing'
                            {'w:after' => value}
                          when 'indent_left'
                            {'w:left' => value}
                          when 'indent_right'
                            {'w:right' => value}
                          when 'indent_between'
                            v = value.split '-'
                            next unless v.is_a?(Array)
                            { 'w:left' => v[0].to_i, 'w:right' => v[1].to_i }
                          when !!value == value
                            nil
                          else
                            {'w:val' => value}
                          end
              doc_style = ParagraphStyleList[style_name]
              @xml.send(doc_style, attribute)
            end
          }
        end
      end
    end
  end
end