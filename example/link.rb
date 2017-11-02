require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'link.docx')
Rubyword::Document::generate(filename) {
  section {
    link 'baidu', 'http://www.baidu.com', text_align: 'center'
  }
}