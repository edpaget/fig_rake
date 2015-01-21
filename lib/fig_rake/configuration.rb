require 'yaml'

module FigRake
  class Configuration
    attr_accessor :container_name, :rake_args
    
    def initialize(name=nil)
      @container_name = name ||= name_from_defaults
    end

    def name_from_defaults
      name_from_environment ||
        name_from_frake_configuration ||
        name_from_fig
    end

    def name_from_environment
      ENV['FRAKE_DEFAULT']
    end

    def name_from_frake_configuration
      File.read('.frake')
    rescue Errno::ENOENT
      nil
    end

    def name_from_fig
      container_config = YAML.load(File.read('fig.yml')).to_a.select do |(_, opts)|
        opts.has_key?("build")
      end
      container_config.first.first
    rescue Errno::ENOENT
      nil
    end
  end
end
