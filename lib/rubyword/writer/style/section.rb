# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Style
      class Section < Base

        MarginsDefault = {
          width: 11870, 
          height: 16787,
          margin: 1440,
          gutter: 0,
          header_height: 720,
          footer_height: 720,
          column_count: 1,
          column_spacing: 720
        }.freeze

        Margins = {
          'w:top' => MarginsDefault[:margin],
          'w:right' => MarginsDefault[:margin],
          'w:bottom' => MarginsDefault[:margin],
          'w:left' => MarginsDefault[:margin],
          'w:header' => MarginsDefault[:header_height],
          'w:footer' => MarginsDefault[:footer_height],
          'w:gutter' => MarginsDefault[:gutter]
        }
        
        Orientation = 'portrait'.freeze
        Landspace = 'landscape'.freeze

        def write
          @xml.send('w:sectPr') {
            # header or footerReference
            [@rubyword.header, @rubyword.footer].each do |target|
              next if target.nil?
              @xml.send("w:#{target[:type]}Reference", {
                'w:type' => 'default',
                'r:id' => "rId#{target[:rid]}"
              })
            end
            
            # pgsize
            @xml.send('w:pgSz', {
              'w:orient' => Orientation,
              'w:w' => MarginsDefault[:width],
              'w:h' => MarginsDefault[:height]
            })
            #borders 暂无

            # pgMar
            @xml.send('w:pgMar', Margins)
            # cols
            @xml.send('w:cols', 'w:num' => MarginsDefault[:column_count], 'w:space' => MarginsDefault[:column_spacing])
            #Page numbering start 暂无

            # Line numbering 暂无

          }
        end

      end
    end
  end
end