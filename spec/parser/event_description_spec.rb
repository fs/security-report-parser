# encoding: utf-8

require 'spec_helper'

describe Parser::EventDescription do
  subject(:description) do
    ->(description) { Parser::EventDescription.new(description) }
  end

  it 'parse user name' do
    expect(description['Снятие с охраны ключом 1'].user_name).to eq('Timur Vafin')
  end

  it 'parse event type' do
    expect(description['Снятие с охраны ключом 1'].event_type).to eq(:open)
    expect(description['Постановка с охраны ключом 1'].event_type).to eq(:close)
  end

  it 'show unknown user name' do
    expect(description['Снятие с охраны ключом 123'].user_name).to eq('Unknown User')
    expect(description['Invalid string'].user_name).to eq('Unknown User')
  end
end
