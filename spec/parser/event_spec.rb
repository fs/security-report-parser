# encoding: utf-8

require 'spec_helper'

describe Parser::Event do
  subject(:event) { Parser::Event.new('02/03/13', '08:32:38', 'Снятие с охраны ключом 1') }

  it 'datetime' do
    expect(event.datetime.to_s).to eq('2013-03-02T08:32:38+04:00')
  end

  it 'description' do
    expect(event.description).to eq('Снятие с охраны ключом 1')
  end

  it 'type' do
    expect(event.event_type).to eq(:open)
  end

  it 'user name' do
    expect(event.user_name).to eq('Timur Vafin')
  end

  it 'determines unsual' do
    Parser::Checker.should_receive(:unusual?).with(event.datetime) { true }
    expect(event.unusual?).to eql(true)
  end
end
