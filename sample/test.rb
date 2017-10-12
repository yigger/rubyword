require_relative '../lib/rubyword'

rubyword = Rubyword::Document.new
section = rubyword.addSection

section.generate{|sc|
  sc.text str
  sc.text 'first title', 'title_1'
}

section.header 'zhbit'
section.footer 'center'

section2 = rubyword.addSection
section2.generate{|sc|
  sc.text 'other'
  sc.text 'section2 title', 'title_1'
  sc.text 'section2 title2', 'title_2'
}

rubyword.save('hello.docx')
# rubyword.save('hello.zip')

# new format
# rubyword = Rubyword::Document.new::generate{
#   toc true
#   header 'zhbit'
#   footer 'number/roman', 'center'
#   section {
#     text 'title'
#     title '1', 'title'
#   }

#   section {
#     text 'title2'
#     title '2', 'title2'
#   }
# }


