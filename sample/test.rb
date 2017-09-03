require_relative '../lib/rubyword'
rubyword = Rubyword::Rubyword.new

section = rubyword.addSection
fontStyle = {
  'name' => 'Times New Roman',
  'size' => 20
}
section.addText('Test write doc', fontStyle)
rubyword.save('hello.docx')
 
# t = Rubyword::Writer::Document.new
# puts t.write