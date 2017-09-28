require_relative '../lib/rubyword'
fontStyle = {
  'name' => 'Times New Roman',
  'size' => 20
}

rubyword = Rubyword::Document.new
section = rubyword.addSection

section.generate{|sc|
  sc.text = "Hello World"
  # sc.style = fontStyle
}
section.pagination("number")

# puts section.text
# puts section.instance_variables.map{|v|v.to_s[1..-1]}
rubyword.save('hello.docx')

