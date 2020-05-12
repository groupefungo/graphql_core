require "graphql_core/engine"
require "graphql_core/version"
require "graphql_core/configuration"

module GraphqlCore
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

# require 'graphql_core/schema'
# require 'app/graphql/graphql_core/connections/base_connection'
# require 'app/graphql/graphql_core/interfaces/base_interface'
