module Rubyword
  class Document
    attr_accessor :sections
    def initialize
      @sections = []
    end

    def addSection(style = nil)
      @section = Element::Section.new(@sections.count + 1, style)
      @sections.push(@section)
      @section
    end

    def save(filename = 'test.doc')
      writer = Writer::Part::Writer.new(self)
      writer.save(filename)
    end
  end
  
end
