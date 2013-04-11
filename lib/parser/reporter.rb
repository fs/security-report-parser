require 'ansi/code'

module Parser
  class Reporter
    EVENT_TYPE_COLORS = {
      open: :green,
      close: :blue,
      unknown: :white
    }.freeze

    def self.report(event)
      new(event).report
    end

    def initialize(event)
      @event = event
    end

    def report
      "#{datetime} #{user_name}: #{description}"
    end

    private

    def datetime
      @event.datetime.strftime('%Y %b %e %a %T')
    end

    def user_name
      with_color { @event.user_name }
    end

    def description
      if @event.unusual?
        ANSI.red { @event.description }
      else
        @event.description
      end
    end

    def with_color
      ANSI.send(EVENT_TYPE_COLORS[@event.event_type]) { yield }
    end
  end
end
