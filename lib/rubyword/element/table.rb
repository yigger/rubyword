# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Table < Base
      attr_accessor :trs
      def initialize(rubyword, section=nil, style)
        super(rubyword, section)
        @style = style
        @trs ||= []
      end
      
      def tr(style=nil, &block)
        return unless block_given?
        tr = Tr.new
        tr.instance_eval(&block)
        @trs << tr
      end

      def write(section=nil, xml=nil)
        @xml = xml
        @xml.send('w:tbl') { 
          @xml.send('w:tblGrid') {
            @xml.send('w:gridCol', 'w:w' => '1750', 'w:type' => 'dxa')
            @xml.send('w:gridCol', 'w:w' => '1750', 'w:type' => 'dxa')
            @xml.send('w:gridCol', 'w:w' => '1750', 'w:type' => 'dxa')
          }
          @trs.each do |tr|
            @xml.send('w:tr') {
              @xml.send('w:trPr')
              tr.texts.each do |text|
                @xml.send('w:tc') {
                  @xml.send('w:tcPr') {
                    @xml.send('w:tcW', 'w:w'=>'1750', 'w:type' => 'dxa')
                  }
                  @xml.send('w:p') {
                    Writer::Style::Paragraph.new(@section, @xml, @rubyword).write(text[:style])
                    @xml.send('w:r') do
                      Writer::Style::Word.new(@section, @xml, @rubyword).write(text[:style])
                      @xml.send('w:t', {'xml:space' => 'preserve'}, text[:text])
                    end
                  }
                }
              end
            }
          end
        }
      end

    end

    class Tr
      attr_accessor :texts
      def th(text, style=nil)
        @texts ||= []
        @texts << { text: text, style: style }
      end
    end

  end
end