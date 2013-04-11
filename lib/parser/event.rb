require 'date'

module Parser
  class Event
    DATETIME = '%s %s +0400'
    PARSE_FORMAT = '%d/%m/%y %T %Z'

    def initialize(date, time, description)
      @date, @time, @description = date, time, description
    end

    def datetime
      @datetime ||= DateTime.strptime(DATETIME % [@date, @time], PARSE_FORMAT)
    end

    def description
      @description
    end

    def user_name
      parsed_description.user_name
    end

    def event_type
      parsed_description.event_type
    end

    def unusual?
      Checker.unusual?(datetime)
    end

    private

    def parsed_description
      @parsed_description ||= EventDescription.new(description)
    end
  end
end
