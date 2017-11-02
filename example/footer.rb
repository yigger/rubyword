require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'footer.docx')
Rubyword::Document::generate(filename) {
  add_footer 'hello', text_align: 'center'
}