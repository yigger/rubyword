# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    module Rels

      def rels_write(xml)
        @relation = @relation_rids.find{|r| r[:type] == 'footer'}
        return if @relation.nil?
        xml.Relationship(Id: "rId#{@relation[:rid]}", Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer', Target: 'footer1.xml')
      end

    end
  end
end