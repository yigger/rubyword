# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Style
      class Section < Base
        def write
          @xml.send('w:sectPr') {
            # header or footerReference
            section.relation_rids.each do |relation|
              @xml.send("w:#{relation[:type]}Reference", {
                'w:type' => 'default',
                'r:id' => "rId#{relation[:rid]}"
              })
            end
            
            # pgsize
            @xml.send('w:pgSz', {
              'w:orient' => @style.orientation,
              'w:w' => @style.margins_default[:width],
              'w:h' => @style.margins_default[:height]
            })
            #borders 暂无

            # pgMar
            @xml.send('w:pgMar', @style.margins)
            # cols
            @xml.send('w:cols', 'w:num' => @style.margins_default[:column_count], 'w:space' => @style.margins_default[:column_spacing])
            #Page numbering start 暂无

            # Line numbering 暂无

          }
        end

      end
    end
  end
end