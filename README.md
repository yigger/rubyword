# RubyWord: Microsoft Word Generation For Ruby

> RubyWord是一个简洁，高效的 Word 文档生成工具， 简单的几行代码就可以生成你需要的 Word 文档。

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
+ 支持设置文档的属性，比如：标题，主题，作者等信息
+ 支持创建多个块，且每个块都拥有自己的样式属性
+ 支持设置全局样式，比如：默认字体大小，字体属性以及默认段落样式等
+ 支持通过标题生成目录结构的文档
+ 支持自定义页头以及页尾
+ 支持插入多种不同属性的标题，比如： 标题一、标题二、标题三等
+ 支持插入空行以及页与页之间的空行
+ 支持插入多张图片
+ 支持插入多个列表
+ 支持插入表格
+ 支持插入 a 标签
+ 更多功能敬请期待，希望各位多提 Issue 来帮助我完善功能

# Usage
```
  require "rubyword"

  Rubyword::Document::generate('hello.docx') {
    # 根据标题生成目录结构..
    title_directory font_size: 24

    # 生成页头
    add_header 'rubyword'

    # 生成页尾
    add_footer 'number', text_align: 'center'
    
    # 生成块，可在里面输入文本
    section {
      # 一级标题
      title_1 '系统架构', ignore_dir: true 
      # 二级标题
      title_2 '架构视图'
      # 一级标题
      title_1 '数据库'
      # 二级标题
      title_2 'MySQL'
      # 三级标题
      title_3 'NoSQL'

      # 插入文本
      text 'hello word', bgcolor: 'yellow', text_align: 'center'

      # 插入文本
      text 'hello word', indent_between: '1440-1440'
      text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }

      # 插入标题
      title_1 'section2 title'
      title_2 'section2 title'
      title_3 'section2 title'
    }

    section {
      # 插入文本
      text 'another Section', bgcolor: 'yellow', text_align: 'center'

      # 插入文本
      text 'hello word', indent_between: '1440-1440'
      text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }
    }

  }
```

# Functions
+ text

+ addheader

+ addfooter



# Contributing
因为这是我业余时间编写的项目，可能有很多地方都不完善以及会暴露出很多BUG，所以我是非常欢迎各位提PR一起改进这个项目的，提PR的流程： 
1. fork this project
2. git clone your fork project
3. git checkout -b fixed-something
4. git commit fixed some bug.
5. git push to your fork project
6. create a new pr to request merge

# 为什么我要写这个项目
灵感来自于 PHPWord， 当我看到 PHPWord 项目的时候我是非常惊喜的，因为这是一个非常厉害的项目，里面实现了各种功能。而当我在 Google 搜 RubyWord 的时候竟然找不到此类项目。 如果借助 `nokogiri` 这个 gem 包来实现 XML 格式的 Word 文档还是非常方便的，  所以便写了这个项目。

# License
