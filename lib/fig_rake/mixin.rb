require 'fig_rake/configuration'
require 'fig_rake/command'

module FigRake
  module Mixin
    def run_in_fig(args)
      configuration = Configuration.new(default_name)
      Command.new(command, configuration.container_name, args).exec
    end
  end
end
