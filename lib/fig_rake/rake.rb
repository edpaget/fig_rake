require 'rake/application'
require 'fig_rake/mixin'

module FigRake
  module Rake
    include FigRake::Mixin
    
    def self.default_container(name=nil)
      return @name unless name
      @name = name
    end

    def default_name
      FigRake::Rails.default_container
    end
    
    def command
      :rake
    end
  end
end

module Rake
  class Application
    include FigRake::Rake

    tl = self.instance_method(:top_level)

    define_method :top_level do
      if ENV['FIG_RAKE']
        run_in_fig(ARGV)
      else
        tl.bind(self).call
      end
    end
  end
end
