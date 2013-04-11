require 'parser/version'
require 'parser/config'
require 'parser/checker'
require 'parser/event_description'
require 'parser/event'
require 'parser/reporter'
require 'parser/sheet'
require 'parser/cli'

module Parser
  extend self

  def configuration
    @configuration ||= Config.new
  end
end
