require 'yaml'
require 'active_support/core_ext/hash/keys'

module Parser
  class Config
    DEFAULTS = {
      from: '11:00',
      till:  '20:00',
      users: {
        1 => 'Timur Vafin',
        2 => 'Alexey Mamaev',
        3 => 'Oleg Kurnosov'
      }
    }.freeze

    OPTIONS = [:from, :till, :users]

    attr_accessor *OPTIONS

    def initialize
      reset!
    end

    def load!(file)
      config = config_from_file(file)

      OPTIONS.each do |key|
        set_option(key, config[key]) if config.include?(key)
      end
    end

    def reset!
      OPTIONS.each do |key|
        set_option(key, DEFAULTS[key])
      end
    end

    private

    def config_from_file(file)
      @config_from_file ||= YAML.load(File.read(file)).symbolize_keys
    end

    def set_option(key, value)
      self.send("#{key}=", value)
    end
  end
end
