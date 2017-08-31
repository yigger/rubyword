module Rubyword
  module Writer
    class Writer
      attr_accessor :rubyword
      def initialize(rubyword)
        @rubyword = rubyword
      end

      def save(filename)
        obj = Object.const_get('Rubyword::Writer::Document').new(@rubyword)
        puts obj.write

        # filename = File.join(::Rubyword::TEMP_PATH, filename)
        # buffer = Zip::OutputStream.write_buffer do |zio|
        #   zip_files.each do |helper_method, entry|
        #     obj = Object.const_get("Rubyword::Writer::#{helper_method}").new(@rubyword)
        #     source = obj.write
        #     zio.put_next_entry(entry)
        #     zio.write(source)
        #   end
        # end
        # file = File.new(filename,'wb')
        # file.write(buffer.string)
        # file.close
      rescue => ex
        puts ex.message
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
          'FontTable' => 'word/fontTable.xml'
          # 'theme' => 'word/theme/theme1.xml'
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