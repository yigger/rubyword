require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'list.docx')
Rubyword::Document::generate(filename) {
  section {
    list 'test1', 1, { font_size: 62, color: '996699', blod: true, text_align: 'center' }
    list 'test1', 2
    list 'test3', 2
    list 'test2', 1
    list 'test2', 1
  }
}