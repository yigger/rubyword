module Rubyword
  module Writer
    module Style
      class Section < Base
        def write(xml)
          # @section.break_type
          xml.send('w:sectPr') {
            # footerReference
            xml.send('w:footerReference', {
              'w:type' => 'default',
              'r:id' => section.rid
            })
            
            # pgsize
            xml.send('w:pgSz', {
              'w:orient' => @style.orientation,
              'w:w' => @style.margins_default[:width],
              'w:h' => @style.margins_default[:height]
            })
            #borders 暂无

            # pgMar
            xml.send('w:pgMar', @style.margins)
            # cols
            xml.send('w:cols', 'w:num' => @style.margins_default[:column_count], 'w:space' => @style.margins_default[:column_spacing])
            #Page numbering start 暂无

            # Line numbering 暂无

          }
        end

      end
    end
  end
end