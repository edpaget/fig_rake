module FigRake
  class Command
    attr_accessor :container_name, :rake_args, :command
    
    def initialize(command, container_name, rake_args)
      @command, @container_name, @rake_args = command, container_name, rake_args
    end

    def exec
      exit system("fig run --rm --entrypoint=#{command} #{container_name} #{rake_args.join(' ')}")
    end
  end
end
