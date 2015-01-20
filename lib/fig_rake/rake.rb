module FigRake
  module Rake
    def self.default_container(name=nil)
      return @name unless name
      @name = name
    end
  end
end
