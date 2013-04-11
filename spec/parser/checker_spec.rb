require 'spec_helper'

describe Parser::Checker do
  subject(:checker) do
    ->(datetime) { Parser::Checker.unusual?(DateTime.parse(datetime)) }
  end

  context 'on weekends' do
    it 'detects unusual at any time' do
      expect(checker['2013-04-13 02:00']).to eq(true)
      expect(checker['2013-04-14 12:00']).to eq(true)
    end
  end

  context 'on workdays' do
    it 'detects unusual time before 11:00' do
      expect(checker['2013-04-10 09:00']).to eq(true)
    end

    it 'detects unusual time after 20:00' do
      expect(checker['2013-04-10 21:00']).to eq(true)
    end

    it 'detects usual time between 11:00-20:00' do
      expect(checker['2013-04-10 11:00']).to eq(false)
      expect(checker['2013-04-10 15:00']).to eq(false)
      expect(checker['2013-04-10 20:00']).to eq(false)
    end
  end
end
