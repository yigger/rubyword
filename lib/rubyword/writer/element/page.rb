module Rubyword
  module Writer
    module Element
      class Page < Base
        
        def write(xml)
          xml.send('w:p') do
            xml.send('w:r') do
              xml.send('w:t', {'xml:space' => 'preserve'}, @section.text)
            end
          end
        end

      end
    end
  end
end