module Rubyword
  module Writer
    class Writer
      ZIP_FILES = {
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
      }

      def save(filename)
        obj = Object.const_get('Rubyword::Writer::Document').new
        filename = File.join(::Rubyword::TEMP_PATH, filename)
        buffer = Zip::OutputStream.write_buffer do |zio|
          ZIP_FILES.each do |helper_method, entry|
            obj = Object.const_get("Rubyword::Writer::#{helper_method}").new
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
      
      def doc_props_app
				builder = Nokogiri::XML::Builder.new do |xml|
					xml.Properties(xmlns: 'http://schemas.openxmlformats.org/officeDocument/2006/extended-properties', 
												 'xmlns:vt' => 'http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes') do
						xml.Company 'young'
						xml.Manager 'young'
					end
				end
				builder.to_xml
			end

    end
  end
end