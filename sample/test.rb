require_relative '../lib/rubyword'
fontStyle = {
  'name' => 'Times New Roman',
  'size' => 20
}

rubyword = Rubyword::Document.new
section = rubyword.addSection

section.generate{|sc|
  sc.text "Hello World"
  sc.header 'haha'
  sc.pagination 'number'
}

rubyword.save('hello.docx')
rubyword.save('hello.zip')

