# RubyWord: Microsoft Word Generation For Ruby
> RubyWord 是一个便捷的 word 文档生成工具

# 语言
* [English](README.md)
* [简体中文](README.cn.md)

# 更新日志
[ChANGELOG](CHANGELOG.md)

# 使用前请先阅读
这个项目正在开发中，因为只有我自己在开发，所以进度可能会比较缓慢以及可能会存在很多未知的问题。这方面请多谅解，同时也希望各位有兴趣的朋友也加入到开发来，欢迎多提宝贵意见或者直接提PR也是非常欢迎的，感谢支持。

# 安装
```
gem install rubyword
```
或者将下面这句代码写入到Gemfile
```
gem 'rubyword'
```
# 特性
+ 支持设置文档的属性，比如： 标题，副标题，作者以及等等
+ 支持插入段落
+ 支持根据一级标题，二级标题，多级标题自动生成目录结构
+ 支持设置页头和页尾
+ 支持插入多级标题
+ 支持插入空行符以及空白页
+ 支持插入图片
+ 支持插入列表
+ 支持插入超链接
+ 支持插入表格
+ 更多功能，敬请期待..

# 用法说明
```
require "rubyword"
Rubyword::Document::generate('hello.docx') {
  # word 文档的属性
  information({
    company: 'ruby word',
    creator: 'young',
    title: 'example word file',
    description: 'this is a example docx',
    subject: 'how to create doc info',
    keywords: 'remark',
    category: 'category'
  })
  
  section {
    text '普通段落1'
    p(text_align: 'center') {
      text '连续的文本1'
      text '连续的文本'
    }
    text '普通段落2'

    p {
      text '不居中的文本 '
      text '黄色的文本', bgcolor: 'yellow', text_align: 'center'
    }
  }

  # 根据标题生成目录
  title_directory font_size: 24

  # 插入页头
  add_header 'rubyword'

  # 插入页尾，并以数字作为页码
  add_footer nil, text_align: 'center', nums_type: 'number'
  # 插入页尾，使用字符作为页码
  # add_footer 'hello', text_align: 'center'

  section {
    # 二级标题
    title_2 "It's a subtitle"
    # 一级标题
    title_1 'Database'
    # 二级标题
    title_2 'MySQL'
    # 三级标题
    title_3 'NoSQL'
    # 一级标题，并且不把它列入目录生成的范围
    title_1 "It's a title", ignore_dir: true 
    # 空白行
    text_break 3
    # 插入文本并指定样式
    text 'hello word', bgcolor: 'yellow', text_align: 'center'
    # 空白页
    page_break 2
    # 插入文本
    text 'hello word', indent_between: '1440-1440'
    text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }

    # 插入标题
    title_1 'section2 title'
    title_2 'section2 title'
    title_3 'section2 title'

    # 插入链接
    link 'baidu', 'http://www.baidu.com', text_align: 'center'
  }

  section {
    # 插入文本
    text 'another Section', bgcolor: 'yellow', text_align: 'center'

    # 插入文本
    text 'hello word', indent_between: '1440-1440'
    text 'title', { font_size: 62, color: '996699', blod: true, text_align: 'center' }
  }

  # 插入列表
  section {
    list 'test1', 1
    list 'test1', 2
    list 'test3', 2
    list 'test2', 1
    list 'test2', 1
  }

  section {
    # 插入链接
    link 'baidu', 'http://www.baidu.com', text_align: 'center'
    # 插入图片
    image 'http://www.baidu.com/img/bd_logo1.png'
    # 插入表格
    table {
      tr {
        th 'id'
        th 'name'
        th 'age'
      }
      tr {
        th '1'
        th 'young'
        th '66'
      }
    }
  }


}
```

# 文档
[查看文档](doc/README.md)

# 马上要做的
+ 支持更多样式
+ 支持markdown/html转换为word

# 贡献
非常欢迎有兴趣的朋友加入到开发中，以下是提交流程
1. fork this project
2. git clone your fork project
3. git checkout -b fixed-something
4. git commit fixed some bug.
5. git push to your fork project
6. create a new pr to request merge

# 灵感
首先非常感谢 [PHPWord](https://github.com/PHPOffice/PHPWord), 因为在无意中发现了 PHPWord 的这个非常强大项目， 并且该项目支持很多各种各样的特性。但是当我在寻找我大 Ruby 这类相关项目的时候居然找不到，本着学习的精神，参考了 PHPWord 的设计，就自己写了一个啦，欢迎 Star 支持一下。

# 协议
RubyWord is licensed under [The MIT License](LICENSE)