module FigRake
  class Command
    attr_accessor :container_name, :rake_args, :command, :docker_command
    
    def initialize(command, container_name, rake_args, docker_command)
      @command, @container_name, @rake_args, @docker_command = command, container_name, rake_args, docker_command
    end

    def exec
      p "#{docker_command} run --rm --entrypoint=#{command} #{container_name} #{rake_args.join(' ')}"
      exit system("#{docker_command} run --rm --entrypoint=bundle #{container_name} exec #{command} #{rake_args.join(' ')}")
    end
  end
end
