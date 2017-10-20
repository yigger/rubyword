# -*- encoding : utf-8 -*-
require_relative "writer/part/base"
require_relative "writer/part/toc"
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
# style file
require_relative 'writer/style/base'
require_relative 'writer/style/section'

module Rubyword
  module Writer
    # word base file
    DocumentBaseFile = {
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
    }.freeze

    def save(filename = 'document.docx')
      buffer = Zip::OutputStream.write_buffer do |zio|
        write_header_and_footer(zio)

        # write image
        self.images.each do |image|
          source = open(image[:path]).read 
          zio.put_next_entry("word/media/#{image[:filename]}")
          zio.write(source)
        end

        DocumentBaseFile.each do |helper_method, entry|
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

    def write_header_and_footer(zio)
      header = self.header
      footer = self.footer
      if header
        elmFile = "word/header#{header[:id]}.xml"
        obj = Part::Header.new(self)
        source = obj.write
        zio.put_next_entry(elmFile)
        zio.write(source)
      end

      if footer
        elmFile = "word/footer#{footer[:id]}.xml"
        obj = Part::Footer.new(self)
        source = obj.write
        zio.put_next_entry(elmFile)
        zio.write(source)
      end
    end
    
  end
end

