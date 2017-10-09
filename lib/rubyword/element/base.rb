# -*- encoding : utf-8 -*-
module Rubyword
  module Element
    class Base

      attr_accessor :section_id, :style, :init_rid, :texts, :rubyword, :relation_rids

      def initialize(rubyword, relation_rids)
        @rubyword = rubyword
        @init_rid = @rubyword.init_rid
        @relation_rids = relation_rids
      end

    end
  end
end