# -*- encoding : utf-8 -*-
module Rubyword
  module Writer
    module Element
      class Base
        attr_accessor :rubyword, :section, :xml
        
        def initialize(rubyword, section=nil, xml=nil)
          @rubyword, @section, @xml = rubyword, section, xml
        end
      end
  end
  end
end