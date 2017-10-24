# RubyWord: Microsoft Word Generation For Ruby
> RubyWord 是一个简单， 高效的 word 文档生成工具

# Language
* [English](README.md)
* [简体中文](README.cn.md)

# 使用前请先阅读
这个项目正在开发中，因为只有我自己在开发，所以进度可能会比较缓慢以及可能会存在很多未知的问题(:跑)，但是我会尽我所能，尽量挤出时间去完善它，同时也希望各位有兴趣的朋友也加入到开发来，欢迎多提宝贵意见或者直接提PR也是非常欢迎的，感谢支持。

# 安装
```
gem install rubyword
```
或者将下面这句代码写入到Gemfile
```
gem 'rubyword'
```
# 特性
+ Support for setting the properties of the document, such as: title, subject, author and other information
+ Support for insert a paragraph
+ Support for generated TOC for the title
+ Support for setting header and footer
+ Support for insert title which is different attributes, such as: title, sub title, etc.
+ Support for insert blank lines and blank page
+ Support for insert multiple images 
+ Support for insert multiple lists 
+ Support for insert hyperlink 

# 用法说明
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

# 马上要做的
+ Support table
+ Support more style
+ Support Markdown/HTML to docx

# 贡献
RubyWord is use my spare time to write, so it may has a lot of Bugs and welcome everyone to create Pull Request or Issue to improve this project together.
1. fork this project
2. git clone your fork project
3. git checkout -b fixed-something
4. git commit fixed some bug.
5. git push to your fork project
6. create a new pr to request merge

# 灵感
Thanks [PHPWord](https://github.com/PHPOffice/PHPWord), I was very surprised when I saw the PHPWord project which is a very powerful project and provide a lot of features. But I can't find such as ruby project when i search in google and I decided to write and design by myself.

# 开源协议
RubyWord is licensed under [The MIT License](LICENSE)