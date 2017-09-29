# -*- encoding : utf-8 -*-
require_relative "writer/part/base"
require_relative "writer/part/content_types"
require_relative "writer/part/doc_props_app"
require_relative "writer/part/doc_props_core"
require_relative "writer/part/doc_props_custom"
require_relative "writer/part/document"
require_relative "writer/part/font_table"
require_relative "writer/part/numbering"
require_relative "writer/part/rels_document"
require_relative "writer/part/rels"
require_relative "writer/part/settings"
require_relative "writer/part/styles"
require_relative "writer/part/theme"
require_relative "writer/part/web_settings"
require_relative "writer/part/footer"
require_relative "writer/part/header"

require_relative 'writer/style/base'
require_relative 'writer/style/section'

module Rubyword
  module Writer
    def save(filename = 'test.docx')
      filename = File.join(::Rubyword::TEMP_PATH, filename)
      buffer = Zip::OutputStream.write_buffer do |zio|
        # add header and footer
        add_header_content(zio)
        add_footer_content(zio)

        # add normal content
        zip_files.each do |helper_method, entry|
          obj = eval "Part::#{helper_method}.new(self)"
          source = obj.write
          zio.put_next_entry(entry)
          zio.write(source)
        end
      end
      file = File.new(filename,'wb')
      file.write(buffer.string)
      file.close
    end

    def add_footer_content(zio)
      elmFile = "word/footer1.xml"
      obj = Part::Footer.new(@rubyword)
      source = obj.write
      zio.put_next_entry(elmFile)
      zio.write(source)
    end

    def add_header_content(zio)
      elmFile = "word/header1.xml"
      obj = Part::Header.new(@rubyword)
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

