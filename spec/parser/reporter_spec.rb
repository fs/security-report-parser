# encoding: utf-8

require 'spec_helper'

describe Parser::Reporter do
  let(:event) do
    double(Parser::Event,
      datetime: double(strftime: 'datetime'),
      user_name: 'user_name',
      description: 'description',
      unusual?: false
    )
  end

  subject(:report) { Parser::Reporter.report(event) }

  context 'open' do
    before do
      event.stub(:event_type) { :open }
    end

    it 'report' do
      expect(report).to eq("datetime \e[32muser_name\e[0m: description")
    end
  end

  context 'close' do
    before do
      event.stub(:event_type) { :close }
    end

    it 'report' do
      expect(report).to eq("datetime \e[34muser_name\e[0m: description")
    end

    context 'unusual' do
      before do
        event.stub(:unusual?) { true }
      end

      it 'report' do
        expect(report).to eq("datetime \e[34muser_name\e[0m: \e[31mdescription\e[0m")
      end
    end
  end
end
