# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    module Rels

      def rels_write(xml)
        @relation = @relation_rids.find{|r| r[:type] == 'footer'}
        @relation_rids.each do |relation|
          if relation[:type] == 'footer'
            return xml.Relationship(Id: "rId#{relation[:rid]}", Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer', Target: 'footer1.xml')
          elsif relation[:type] == 'header'
            return xml.Relationship(Id: "rId#{relation[:rid]}", Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/header', Target: 'header1.xml')
          end
        end
        nil
      end

    end
  end
end