require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'header.docx')
Rubyword::Document::generate(filename) {
  add_header 'rubyword'
}