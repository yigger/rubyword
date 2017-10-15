# RubyWord: Microsoft Word Generation For Ruby

> RubyWord is a simple, efficient Word document generation gem and easy to generate docx file.

# Installing RubyWord
It's very easy to install rubyword, you just exec this command
```
  gem install rubyword
```
or add these to Gemfile
```
  ...
  gem rubyword
  ...
```
# Features
+ 支持设置文档的属性，比如：标题，主题，作者等信息(未完成)
+ 支持创建多个块，且每个块都拥有自己的样式属性
+ 支持设置全局样式，比如：默认字体大小，字体属性以及默认段落样式等
+ 支持通过标题生成目录结构的文档
+ 支持自定义页头以及页尾
+ 支持插入多种不同属性的标题，比如： 标题一、标题二、标题三等
+ 支持插入空行以及页与页之间的空行(未完成)
+ 支持插入多张图片(未完成)
+ 支持插入多个列表(未完成)
+ 支持插入表格(未完成)
+ 支持插入 a 标签(未完成)
+ 更多功能敬请期待，希望各位多提 Issue 来帮助我完善功能

# Usage
```
  require "rubyword"

  Rubyword::Document::generate('hello.docx') {
    # Generate the directory structure
    title_directory font_size: 24

    # insert header
    add_header 'rubyword'

    # insert footer
    add_footer 'number', text_align: 'center'
    
    # initialize section and insert something in the section
    section {
      # insert title
      title_1 'It's a title', ignore_dir: true 
      # insert subtitle
      title_2 'It's a subtitle'
      # insert title
      title_1 'Database'
      # insert subtitle
      title_2 'MySQL'
      # insert No.3 title
      title_3 'NoSQL'

      # insert text
      text 'hello word', bgcolor: 'yellow', text_align: 'center'

      # insert text
      text 'hello word', indent_between: '1440-1440'
      text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }

      # insert title
      title_1 'section2 title'
      title_2 'section2 title'
      title_3 'section2 title'
    }

    section {
      # insert a text
      text 'another Section', bgcolor: 'yellow', text_align: 'center'

      # insert a text
      text 'hello word', indent_between: '1440-1440'
      text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }
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
Inspired by PHPWord, I was very pleasantly surprised when I saw the PHPWord project which is a very powerful project and provide a lot of features. But I can't find such as ruby project when i search in google. so here is why i wrote the project.

# License
RubyWord is licensed under [The MIT License](LICENSE)