require 'rake/application'
require 'fig_rake/configuration'
require 'fig_rake/command'

module FigRake
  module Rake
    def self.default_container(name=nil)
      return @name unless name
      @name = name
    end

    def default_container(name)
      FigRake::Rake.default_container(name)
    end

    def run_in_fig(args)
      configuration = Configuration.new
      Command.new(:rake, configuration.container_name, args).exec
    end
  end
end

module Kernel
  include FigRake::Rake
end

module Rake
  class Application
    include FigRake::Rake

    tl = self.instance_method(:top_level)

    define_method :top_level do
      if ENV['FIG_RAKE'] == 'off'
        tl.bind(self).call
      else
        run_in_fig(ARGV)
      end
    end
  end
end
