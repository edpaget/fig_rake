require 'fig_rake/configuration'
require 'fig_rake/command'

module FigRake
  module Mixin
    def run_in_fig(args)
      configuration = Configuration.new(name: default_name)
      Command.new(command, configuration.container_name, args, configuration.docker_command).exec
    end
  end
end
