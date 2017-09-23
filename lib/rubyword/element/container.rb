module Rubyword
  module Element
    class Container
      attr_accessor :elements
      ELEMENTS = [
        'Text', 'TextRun', 'Bookmark', 'Link', 'PreserveText', 'TextBreak',
        'ListItem', 'ListItemRun', 'Table', 'Image', 'Object',
        'Footnote', 'Endnote', 'CheckBox', 'TextBox', 'Field',
        'Line', 'Shape', 'Title', 'TOC', 'PageBreak',
        'Chart', 'FormField', 'SDT'
      ]
      def initialize
        @elements = {} if @elements.nil?
      end

      def functions
        return @functions unless @functions.nil?
        @functions = {}
        elements = [
          'Text', 'TextRun', 'Bookmark', 'Link', 'PreserveText', 'TextBreak',
          'ListItem', 'ListItemRun', 'Table', 'Image', 'Object',
          'Footnote', 'Endnote', 'CheckBox', 'TextBox', 'Field',
          'Line', 'Shape', 'Title', 'TOC', 'PageBreak',
          'Chart', 'FormField', 'SDT'
        ]
        elements.each do |elm|
          functions.merge!({"add#{elm}" => elm})
        end
        @functions
      end

      def method_missing(method_name, *args)
        method_name = method_name.to_s
        if functions.keys.include?(method_name)
          class_name = functions[method_name]
          require_relative class_name.downcase
          @elements = {} if @elements.nil?
          @elements.merge!(class_name) unless @elements.keys.include?(class_name)
          eval "#{class_name}.new(*args)"
        else
          super
        end
      end
    end
  end
end