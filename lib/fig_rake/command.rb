module FigRake
  class Command
    attr_accessor :container_name, :rake_args
    
    def initialize(container_name, rake_args)
      @container_name, @rake_args = container_name, rake_args
    end

    def exec
      exit system("fig run #{container_name} rake #{rake_args.join(' ')}")
    end
  end
end
