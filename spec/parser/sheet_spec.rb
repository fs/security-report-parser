require 'spec_helper'

describe Parser::Sheet do
  let(:sheet) { Parser::Sheet.new('spec/fixtures/fs.xls') }

  it 'collect events' do
    expect(sheet.events.size).to eq(52)
  end

  it 'iterates over events' do
    sheet.each_event do |event|
      expect(event).to be_an_instance_of(Parser::Event)
    end
  end
end
