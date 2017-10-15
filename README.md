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
+ Support for setting the properties of the document, such as: title, subject, author and other information
+ Support to create multiple blocks, and each block has its own style properties
+ Support for setting global styles, such as default font size, font attributes, and default paragraph styles, etc.
+ Support for create directory and generated by the title
+ Support for setting header and footer
+ Support the insertion of a variety of different attributes of the title, such as: title, sub title, etc.
+ Support for inserte blank lines and blank lines between pages and pages (developing)
+ Support for inserte multiple images (developing)
+ Support for inserte multiple lists (developing)
+ Support for insert chart (developing)
+ Support for insert link (developing)
+ A lot of features to be continue

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