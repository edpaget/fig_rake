require 'optparse'
require 'fig_rake/configuration'
require 'fig_rake/command'

module FigRake
  class Cli
    def initialize(arguments)
      @options = Configuration.new
      parse_arguments(arguments)
      @command = Command.new(@options.container_name, @options.rake_args)
    end

    def exec
      @command.exec
    end

    private
    
    def parse_arguments(args)
      OptionParser.new do |opts|
        opts.banner = "Usage: frake [options] [rake arguments]"

        opts.on('-c', '--container-name [NAME]', String,
                "Name of Container to exec rake in") do |name|
          @options.container_name = name
        end
        
        opts.on('-h', '--help', "Show this message") do
          puts opts
          exit
        end

        opts.on('-v', '--version', 'Show Version') do
          puts VERSION
          exit
        end
      end.parse!(args)
      
      @options.rake_args = args
    end
  end
end
