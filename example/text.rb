require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'text.docx')
Rubyword::Document::generate(filename) {
  section {
    text 'another Section', bgcolor: 'yellow', text_align: 'center'
    text 'hello word', indent_between: '1440-1440'
    text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }
  }
}