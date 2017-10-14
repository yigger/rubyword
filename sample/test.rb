require_relative '../lib/rubyword'

Rubyword::Document::generate('hello.docx') {
  title_directory font_size: 24
  add_header 'zhbit'
  add_footer nil, text_align: 'center'
  
  section {
    
    title_1 '系统架构', ignore_dir: true 
    title_2 '架构视图'
    title_1 '数据库'
    title_2 'MySQL'
    title_2 'NoSQL'

    text 'title', { font_size: 62, color: '996699', blod: true }

    # title_1 'section2 title'
    # title_2 'section2 title'
    # title_3 'section2 title'
  }
}