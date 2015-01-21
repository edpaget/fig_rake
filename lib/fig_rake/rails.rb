require 'rails/commands/commands_tasks'
require 'fig_rake/mixin'

module FigRake
  module Rails
    include FigRake::Mixin
    
    def self.default_container(name=nil)
      return @name unless name
      @name = name
    end

    def default_name
      FigRake::Rails.default_container
    end

    def command
      :rails
    end
  end
end

module Rails
  class CommandsTasks
    include FigRake::Rails

    %i(console server dbconsole runner).each do |method|
      m = self.instance_method(method)

      define_method method do
        if ENV['FIG_RAKE'] == 'off'
          m.bind(self).call
        else
          run_in_fig(argv.unshift(method))
        end
      end
    end
  end
end
