require_relative '../lib/rubyword'
class Factory
  attr_accessor :text
  def initialize
    
  end
end

fontStyle = {
  'name' => 'Times New Roman',
  'size' => 20
}

rubyword = Rubyword::Rubyword.new
section = rubyword.addSection
section.generate{|sc|
  sc.text = 'hello world'
  # sc.style = fontStyle
}


# puts section.text
# puts section.instance_variables.map{|v|v.to_s[1..-1]}
rubyword.save('hello.docx')

