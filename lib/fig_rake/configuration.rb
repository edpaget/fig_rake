require 'yaml'
require 'fig_rake/rake'

module FigRake
  class Configuration
    attr_accessor :container_name, :rake_args
    
    def initialize
      @container_name = name_from_defaults
    end

    def name_from_defaults
      name_from_environment ||
        name_from_rake_configuration ||
        name_from_frake_configuration ||
        name_from_fig
    end

    def name_from_environment
      ENV['FRAKE_DEFAULT']
    end

    def name_from_rake_configuration
      FigRake::Rake.default_container
    end

    def name_from_frake_configuration
      File.read('.frake')
    rescue Errno::ENOENT
      nil
    end

    def name_from_fig
      YAML.load(File.read('fig.yaml')).to_a.select do |(_, opts)|
        opts.has_key?("build")
      end.first.first
    rescue Errno::ENOENT
      nil
    end
  end
end
