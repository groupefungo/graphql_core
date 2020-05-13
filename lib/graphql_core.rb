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

require 'graphql_core/helpers/expect_hash_to_eq_helper'
require 'graphql_core/helpers/schema_execute_helper'
