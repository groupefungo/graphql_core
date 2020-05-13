module GraphqlCore
  class Configuration
    attr_accessor :schema_execute, :graphql_route

    def initialize
      @schema_execute = nil
      @graphql_route = nil
    end
  end
end
