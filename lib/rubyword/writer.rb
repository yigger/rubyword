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
# style file
require_relative 'writer/style/base'
require_relative 'writer/style/section'
# element
require_relative 'writer/element/base'
require_relative 'writer/element/text'

module Rubyword
  module Writer
    # word base file
    DOCUMENT_BASE_FILES = {
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

    def save(filename = 'test.docx')
      filename = File.join(::Rubyword::TEMP_PATH, filename)
      buffer = Zip::OutputStream.write_buffer do |zio|
        write_header_and_footer(zio)
        DOCUMENT_BASE_FILES.each do |helper_method, entry|
          obj = eval "Part::#{helper_method}.new(self)"
          source = obj.write
          zio.put_next_entry(entry)
          zio.write(source)
        end
      end
      file = File.new(filename,'wb')
      file.write(buffer.string)
      file.close

      if DEBUG
        destination = File.join(::Rubyword::TEMP_PATH, 'unzip/')
        extract_zip(filename, destination)
      end
    end

    def extract_zip(file, destination)
      FileUtils.mkdir_p(destination)
    
      Zip::File.open(file) do |zip_file|
        zip_file.each do |f|
          fpath = File.join(destination, f.name)
          file = File.new(fpath,'wb')
          content = f.get_input_stream.read
          file.write(content)
          file.close
        end
      end
    end

    def write_header_and_footer(zio)
      self.sections.each do |section|
        next if section.relation_rids.find{ |r| ['header', 'footer'].include?(r[:type].to_s) }.nil?
        section.relation_rids.each do |target|
          elmFile = "word/#{target[:type].to_s}#{section.section_id}.xml"
          obj = eval "Part::#{target[:type].to_s.capitalize}.new(self, section)"
          source = obj.write
          zio.put_next_entry(elmFile)
          zio.write(source)
        end
      end
    end
    
  end
end

