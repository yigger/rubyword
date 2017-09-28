# -*- encoding : utf-8 -*-
module Rubyword
  module Style
    class Section < Base
      def margins
        {
          'w:top' => margins_default[:margin],
          'w:right' => margins_default[:margin],
          'w:bottom' => margins_default[:margin],
          'w:left' => margins_default[:margin],
          'w:header' => margins_default[:header_height],
          'w:footer' => margins_default[:footer_height],
          'w:gutter' => margins_default[:gutter]
        }
      end

      def orientation
        'portrait'.freeze
      end

      def landspace
        'landscape'.freeze
      end

      def margins_default
        {
          width: 11870, 
          height: 16787,
          margin: 1440,
          gutter: 0,
          header_height: 720,
          footer_height: 720,
          column_count: 1,
          column_spacing: 720
        }.freeze
      end
    end
  end
end