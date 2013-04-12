# encoding: utf-8

module Parser
  class EventDescription
    def initialize(description)
      @description = description.to_s
    end

    def user_name
      Parser.configuration.users[user_key] || 'Unknown User'
    end

    def event_type
      case @description
      when /Снятие/
        :open
      when /Постановка/
        :close
      else
        :unknown
      end
    end

    private

    def user_key
      if match = @description.match(/\d+/)
        match[0].to_i
      end
    end
  end
end
