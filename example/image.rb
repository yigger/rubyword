require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'image.docx')
Rubyword::Document::generate(filename) {
  section {
    image 'http://www.baidu.com/img/bd_logo1.png'
  }
}