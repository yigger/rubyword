module Rubyword
  module Element
    module Footer
      attr_accessor :page_format, :page_style

      def initialize
        @page_format = false
      end

      def pagination(page_style)
        @page_style = page_style
      end

      def page_write(xml)
        xml.send('w:p') do
          xml.send('w:r') do
            xml.send('w:t', {'xml:space' => 'preserve'})
          end
        end
      end

    end
  end
end