# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Table < Base
      attr_accessor :trs, :texts

      def initialize(rubyword, section=nil, style)
        super(rubyword, section)
        @style = style
        @trs ||= []
        @texts ||= []
      end
      
      def tr(style=nil, &block)
        return unless block_given?
        self.instance_eval(&block)
      end

      def th(text)
        @texts << {text: text}
      end

      def write(section=nil, xml=nil)
        @xml = xml
        @xml.send('w:tbl') { 
          @xml.send('w:tblGrid') {
            @xml.send('w:gridCol', 'w:w' => '1750', 'w:type' => 'dxa')
            @xml.send('w:gridCol', 'w:w' => '1750', 'w:type' => 'dxa')
            @xml.send('w:gridCol', 'w:w' => '1750', 'w:type' => 'dxa')
          }

          (1..2).each do |row|
            @xml.send('w:tr') {
              @xml.send('w:trPr')
              # 每一列
              (1..3).each do |cell|
                @xml.send('w:tc') {
                  @xml.send('w:tcPr') {
                    @xml.send('w:tcW', 'w:w'=>'1750', 'w:type' => 'dxa')
                  }
                  @xml.send('w:p') {
                    # Writer::Style::Paragraph.new(@section, @xml, @rubyword).write(text[:style])
                    @xml.send('w:r') do
                      # Writer::Style::Word.new(@section, @xml, @rubyword).write(text[:style])
                      @xml.send('w:t', {'xml:space' => 'preserve'}, '2333')
                    end
                  }
                }
              end
            }
          end
        }
      end

    end
  end
end