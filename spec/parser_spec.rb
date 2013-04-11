require 'spec_helper'

describe Parser do
  describe '.configuration' do
    subject(:config) { Parser.configuration }

    it 'instance of Config' do
      expect(config).to be_an_instance_of(Parser::Config)
    end

    it 'have options' do
      expect(config.from).to eq('11:00')
    end

    context 'with config file' do
      before do
        config.load!('spec/fixtures/config.yml')
      end

      it 'load config file' do
        expect(config.from).to eq('8:00')
      end

      it 'reset defaults' do
        expect { config.reset! }.to change { config.from }.from('8:00').to('11:00')
      end
    end
  end
end
