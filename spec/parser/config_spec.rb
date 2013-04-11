require 'spec_helper'

describe Parser::Config do
  subject(:config) { Parser::Config.new }

  context 'without configuration file' do
    let(:file) { nil }

    it 'set default values' do
      expect(config.from).to eq('11:00')
      expect(config.till).to eq('20:00')
      expect(config.users).to eq({
        1 => 'Timur Vafin',
        2 => 'Alexey Mamaev',
        3 => 'Oleg Kurnosov'
      })
    end
  end

  context 'with configuration file' do
    before do
      config.load!('spec/fixtures/config.yml')
    end

    it 'set values from file' do
      expect(config.from).to eq('8:00')
      expect(config.till).to eq('23:00')
      expect(config.users).to eq({1 => 'John Smith'})
    end
  end
end
