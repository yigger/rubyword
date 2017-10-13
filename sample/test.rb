require_relative '../lib/rubyword'

Rubyword::Document::generate('hello.docx') {
  open_toc true
  add_header 'zhbit'
  add_footer nil, text_align: 'center', nums_type: 'roman'
  section {
    text 'title'
    text 'section2 title', 'title_1'
  }
}