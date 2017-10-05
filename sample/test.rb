require_relative '../lib/rubyword'
fontStyle = {
  'name' => 'Times New Roman',
  'size' => 20
}

rubyword = Rubyword::Document.new
section = rubyword.addSection

str = ''
2.times.each do |a|
  str = str + 'hello world'
end

section.generate{|sc|
  sc.text str
  sc.header 'haha'
  sc.pagination 'center'
}

section2 = rubyword.addSection
section2.generate{|sc|
  sc.text 'other'
}

rubyword.save('hello.docx')
# rubyword.save('hello.zip')


