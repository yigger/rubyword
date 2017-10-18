require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'hello.docx')
Rubyword::Document::generate(filename) {
  # information({
  #   company: 'ruby word',
  #   creator: 'young',
  #   title: 'example word file',
  #   description: 'this is a example docx'
  # })

  # title_directory font_size: 24
  # add_header 'zhbit'
  # add_footer nil, text_align: 'center', nums_type: 'number'
  
  # section {
    
  #   title_1 '系统架构', ignore_dir: true 
  #   title_2 '架构视图'
  #   title_1 '数据库'
  #   title_2 'MySQL'
  #   title_2 'NoSQL'
    
  #   text 'hello word123'
  #   # page_break
  #   text_break
  #   text 'hello word1'
  #   title_1 'section2 title'
  #   page_break 2

  #   link '哈哈', 'http://www.baidu.com', text_align: 'center'
  #   text 'hello word3'
  #   link 'baidu', 'http://www.baidu.com', text_align: 'center'
  #   text 'hello word1', indent_between: '1440-1440'
  #   text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }
  #   title_1 'section2 title'

  #   title_2 'section2 title'
  #   title_3 'section2 title'
  # }

  # section {
  #   list 'test1', 1
  #   list 'test1', 2
  #   list 'test3', 2
  #   list 'test2', 1
  #   list 'test2', 1
  # }

  section {
    image 'http://www.baidu.com/img/bd_logo1.png'
  }
}