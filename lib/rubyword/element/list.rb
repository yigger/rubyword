# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class List < Base
      attr_accessor :texts

      def write_object(text)
        @texts ||= []
        @rubyword.relation_rids << {
          Id: "rId#{@rubyword.init_rid}",
          Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink',
          Target: text,
          TargetMode: 'External'
        }
        @rubyword.init_rid = @rubyword.init_rid + 1
      end

    end
  end
end