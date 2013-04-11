require 'spreadsheet'

module Parser
  class Sheet
    EVENT_CODE = '1914'

    def initialize(file)
      @file = file
    end

    def events
      @events ||= [].tap do |events|
        worksheet.each do |row|
          events << Event.new(row[4], row[5], row[10]) if row_is_event?(row)
        end
      end
    end

    def each_event
      events.each do |event|
        yield(event)
      end
    end

    private

    def worksheet
      @worksheet ||= Spreadsheet.open(@file).worksheet(0)
    end

    def row_is_event?(row)
      row[1] == EVENT_CODE
    end
  end
end
