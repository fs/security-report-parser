require 'thor'

module Parser
  class CLI < Thor
    option :config
    desc 'parse FILE', 'Parse report and show some unsual activity'
    def parse(file)
      if options[:config] && File.exists?(options[:config])
        Parser.configuration.load!(options[:config])
      end

      Sheet.new(file).each_event do |event|
        puts Parser::Reporter.report(event)
      end
    end

    default_task :parse
  end
end
