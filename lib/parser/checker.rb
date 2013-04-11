require 'active_support/core_ext/date_time/calculations'

module Parser
  class Checker
    def self.unusual?(datetime)
      new(datetime).unusual?
    end

    def initialize(datetime)
      @datetime = datetime
    end

    def unusual?
      return true if weekend? || before? || after?
      false
    end

    private

    def weekend?
      @datetime.saturday? || @datetime.sunday?
    end

    def before?
      @datetime < datetime_at(Parser.configuration.from)
    end

    def after?
      @datetime > datetime_at(Parser.configuration.till)
    end

    def datetime_at(time)
      hour, minute = time.split(':')
      @datetime.change(hour: hour.to_i, minute: minute.to_i)
    end
  end
end
