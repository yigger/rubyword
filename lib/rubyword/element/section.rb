require_relative 'base'
require_relative 'text'
require_relative 'link'
require_relative 'list'
require_relative 'image'
require_relative 'page_break'
require_relative 'text_break'
require_relative 'paragraph'
require_relative 'table'
module Rubyword
  module Element
    class Section
      attr_accessor :section_id, :style, :rubyword, :section_objects, :objects, :titles

      def initialize(section_count, style = nil, rubyword=nil)
				@section_id = section_count
				@style = style
        @rubyword = rubyword
        @section_objects = []
        @objects = []
        @text_blocks = []
      end
      
      def p(style=nil, &block)
        object ||= Paragraph.new(@rubyword, self, style)
        return nil unless block_given?
        object.instance_eval(&block) 
        @objects << object
      end

      def table(style=nil, &block)
        object ||= Table.new(@rubyword, self, style)
        return nil unless block_given?
        object.instance_eval(&block)
        @objects << object
      end

      def text(text, style=nil)
        object ||= Text.new(@rubyword, self)
        object.save(text, __callee__.to_s, style)
        @objects << object
			end
			alias :title_1 :text
			alias :title_2 :text
			alias :title_3 :text
			alias :title_4 :text

      def list(text, level, style=nil)
        object ||= List.new(@rubyword)
        object.save(text, level, style)
        @objects << object
      end

      def link(text, link, style=nil)
        object ||= Link.new(@rubyword)
        object.save(text, link, style)
        @objects << object
      end

      def image(url)
        object ||= Image.new(@rubyword)
        object.save(url)
        @objects << object
      end

      def page_break(break_num=1)
        object ||= PageBreak.new(@rubyword)
        object.save(break_num)
        @objects << object
      end

      def text_break(break_num=1)
        object ||= TextBreak.new(@rubyword)
        object.save(break_num)
        @objects << object
      end

    end
  end
end