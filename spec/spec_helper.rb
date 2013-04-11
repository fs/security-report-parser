require 'parser'

RSpec.configure do |config|
  config.after(:each) do
    Parser.configuration.reset!
  end
end
