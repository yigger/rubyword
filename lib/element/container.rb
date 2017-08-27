module Rubyword
  module Element
    class Container
      ELEMENTS = [
        'Text', 'TextRun', 'Bookmark', 'Link', 'PreserveText', 'TextBreak',
        'ListItem', 'ListItemRun', 'Table', 'Image', 'Object',
        'Footnote', 'Endnote', 'CheckBox', 'TextBox', 'Field',
        'Line', 'Shape', 'Title', 'TOC', 'PageBreak',
        'Chart', 'FormField', 'SDT'
      ]
      def method_missing(method_name, *args)
        functions = {}
        ELEMENTS.each do |element|
          functions.merge!({"add#{element.downcase}" => element})
        end
        method_name = method_name.to_s.downcase
        if functions.keys.include?(method_name)
          begin
            module_name = functions[method_name]
            require_relative module_name
            eval "#{module_name}.new(args)"
          rescue => ex
            puts "Container Error __LINE__ #{__LINE__}: #{ex.message}"
          end
        else
          super
        end
      end
    end
  end
end