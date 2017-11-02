require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'paragraph.docx')
Rubyword::Document::generate(filename) {
  section {
    p(text_align: 'center') {
      text 'i am '
      text 'a boy'
    }

    text 'welcome to my home..'
  
    p {
      text 'This is a '
      text 'apple, yellow apple', bgcolor: 'yellow', text_align: 'center'
    }
  }
}