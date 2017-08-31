module Rubyword
  module Writer
    class Base
      attr_accessor :rubyword
      def initialize(rubyword)
        @rubyword = rubyword
      end
    end
  end
end