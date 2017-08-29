module Rubyword
  module Writer
    class Writer
      ZIP_FILES = {
        'content_types' => '[Content_Types].xml',
        'rels' => '_rels/.rels',
        'doc_props_app' => 'docProps/app.xml',
        'doc_props_core' => 'docProps/core.xml',
        'doc_props_custom' => 'docProps/custom.xml',
        'rels_document' => 'word/_rels/document.xml.rels',
        'document' => 'word/document.xml',
        'styles' => 'word/styles.xml',
        'numbering' => 'word/numbering.xml',
        'settings' => 'word/settings.xml',
        'web_settings' => 'word/webSettings.xml',
        'font_table' => 'word/fontTable.xml',
        'theme' => 'word/theme/theme1.xml'
        # 'RelsPart' => '',
        # 'Header' => '',
        # 'Footer' => '',
        # 'Footnotes' => '',
        # 'Endnotes' => '',
        # 'Chart' => ''
      }

      def save
        filename = File.join(::Rubyword::TEMP_PATH, 'test.zip')
        buffer = Zip::OutputStream.write_buffer do |zio|
          ZIP_FILES.each do |helper_method, entry|
            source = eval("::Rubyword::XmlBuilderHelper::#{helper_method}")
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
    end
  end
end