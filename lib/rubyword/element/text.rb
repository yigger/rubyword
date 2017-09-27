module Rubyword
  module Element
    module Text
      attr_accessor :text
      
      def text_write(xml)
        xml.send('w:p') do
          xml.send('w:r') do
            xml.send('w:t', {'xml:space' => 'preserve'}, text)
          end
        end
      end

    end
  end
end