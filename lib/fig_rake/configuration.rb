require 'yaml'

module FigRake
  class Configuration
    attr_accessor :container_name, :rake_args, :docker_command

    COMPOSE_FILE = "docker-compose.yml"
    FIG_FILE = "fig.yml"
    
    def initialize(name: nil, command: nil)
      @container_name = name || name_from_defaults
      @docker_command = command || command_from_defaults
    end

    def name_from_defaults
      name_from_environment || name_from_file
    end

    def command_from_defaults
      command_from_environment || command_from_file
    end

    def name_from_environment
      ENV['FIG_RAKE_CONTAINER']
    end

    def command_from_environment
      ENV['FIG_RAKE_COMMAND']
    end

    def compose_file_exists?
      File.exists? COMPOSE_FILE
    end

    def fig_file_exists?
      File.exists? FIG_FILE
    end

    def command_from_file
      case
      when compose_file_exists?
        "docker-compose"
      when fig_file_exists?
        "fig"
      else
        raise "No configuration file found are you in the right Directory?"
      end
    end

    def name_from_file
      file_name = case
                  when compose_file_exists?
                    COMPOSE_FILE
                  when fig_file_exists?
                    FIG_FILE
                  else
                    raise "No configuration file found are you in the right Directory?"
                  end
      
      container_config = YAML.load(File.read(file_name)).to_a.select do |(_, opts)|
        opts.has_key?("build")
      end
      container_config.first.first
    end
  end 
end
