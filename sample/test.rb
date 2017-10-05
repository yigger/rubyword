require_relative '../lib/rubyword'

rubyword = Rubyword::Document.new
section = rubyword.addSection

str = ''
2.times.each do |a|
  str = str + 'hello world'
end

section.generate{|sc|
  sc.text str
  sc.header 'zhbit'
  sc.pagination 'center'
}

section2 = rubyword.addSection
section2.generate{|sc|
  sc.text 'other'
}

rubyword.save('hello.docx')
# rubyword.save('hello.zip')


