# RubyWord: Microsoft Word Generation For Ruby

> RubyWord is a simple, efficient Word document generation gem and easy to generate docx file.

# Installing RubyWord
It's very easy to install rubyword
```
  gem install rubyword
```
# Features
+ Support for setting the properties of the document, such as: title, subject, author and other information
+ Support for generated TOC for the title
+ Support for setting header and footer
+ Support for insert title  insertion of a variety of different attributes of the title, such as: title, sub title, etc.
+ Support for insert blank lines and blank page
+ Support for insert multiple images 
+ Support for insert multiple lists 
+ Support for insert hyperlink 

# Usage
```
  require "rubyword"
  Rubyword::Document::generate('hello.docx') {
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
      image 'http://www.baidu.com/img/bd_logo1.png'
    }
  }
```

# Contributing
RubyWord is use my spare time to write, so it may has a lot of Bugs and welcome everyone to create Pull Request or Issue to improve this project together.
1. fork this project
2. git clone your fork project
3. git checkout -b fixed-something
4. git commit fixed some bug.
5. git push to your fork project
6. create a new pr to request merge

# Inspiration
Thanks [PHPWord](https://github.com/PHPOffice/PHPWord), I was very surprised when I saw the PHPWord project which is a very powerful project and provide a lot of features. But I can't find such as ruby project when i search in google and I decided to write and design by myself.

# License
RubyWord is licensed under [The MIT License](LICENSE)