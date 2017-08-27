require_relative '../lib/rubyword'

rubyword = Rubyword::Rubyword.new
section = rubyword.addSection
section.addText('xixi')
rubyword.save