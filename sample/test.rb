require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'hello.docx')
Rubyword::Document::generate(filename) {
  # write the doc infomation
  information({
    company: 'ruby word',
    creator: 'young',
    title: 'example word file',
    description: 'this is a example docx',
    subject: 'how to create doc info',
    keywords: 'remark',
    category: 'category'
  })
  
  # Generate the directory structure
  title_directory font_size: 24

  # insert header
  add_header 'rubyword'

  # insert footer with number
  add_footer nil, text_align: 'center', nums_type: 'number'
  # insert text
  # add_footer 'hello', text_align: 'center'
  # initialize section and insert something in the section
  section {
    # insert title
    title_1 "It's a title", ignore_dir: true 
    # insert subtitle
    title_2 "It's a subtitle"
    # insert title
    title_1 'Database'
    # insert subtitle
    title_2 'MySQL'
    # insert No.3 title
    title_3 'NoSQL'
    # text break
    text_break 3
    # insert text
    text 'hello word', bgcolor: 'yellow', text_align: 'center'
    # page break
    page_break 2
    # insert text
    text 'hello word', indent_between: '1440-1440'
    text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }

    # insert title
    title_1 'section2 title'
    title_2 'section2 title'
    title_3 'section2 title'

    # add a link
    link 'baidu', 'http://www.baidu.com', text_align: 'center'
  }

  section {
    # insert a text
    text 'another Section', bgcolor: 'yellow', text_align: 'center'

    # insert a text
    text 'hello word', indent_between: '1440-1440'
    text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }
  }

  section {
    list 'test1', 1
    list 'test1', 2
    list 'test3', 2
    list 'test2', 1
    list 'test2', 1
  }

  section {
    # add a link
    link 'baidu', 'http://www.baidu.com', text_align: 'center'
    # image 'http://www.baidu.com/img/bd_logo1.png'
  }
}