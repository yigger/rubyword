module Rubyword
  module Writer
    module Part
      class Writer
        attr_accessor :rubyword
        def initialize(rubyword)
          @rubyword = rubyword
        end

        def save(filename)
          filename = File.join(::Rubyword::TEMP_PATH, filename)
          buffer = Zip::OutputStream.write_buffer do |zio|
            # add header and footer
            add_footer_content(zio)

            zip_files.each do |helper_method, entry|
              obj = eval "#{helper_method}.new(rubyword)"
              source = obj.write
              zio.put_next_entry(entry)
              zio.write(source)
            end
          end
          file = File.new(filename,'wb')
          file.write(buffer.string)
          file.close
        rescue => ex
          puts ex.message
        end

        def add_footer_content(zio)
          elmFile = "word/footer1.xml"
          obj = Footer.new(rubyword)
          source = obj.write
          zio.put_next_entry(elmFile)
          zio.write(source)
        end

        def zip_files
          {
            'ContentTypes' => '[Content_Types].xml',
            'Rels' => '_rels/.rels',
            'DocPropsApp' => 'docProps/app.xml',
            'DocPropsCore' => 'docProps/core.xml',
            'DocPropsCustom' => 'docProps/custom.xml',
            'RelsDocument' => 'word/_rels/document.xml.rels',
            'Document' => 'word/document.xml',
            'Styles' => 'word/styles.xml',
            'Numbering' => 'word/numbering.xml',
            'Settings' => 'word/settings.xml',
            'WebSettings' => 'word/webSettings.xml',
            'FontTable' => 'word/fontTable.xml',
            'Theme' => 'word/theme/theme1.xml'
            # 'RelsPart' => '',
            # 'Header' => '',
            # 'Footer' => '',
            # 'Footnotes' => '',
            # 'Endnotes' => '',
            # 'Chart' => ''
          }.freeze
        end

      end
    end
  end
end