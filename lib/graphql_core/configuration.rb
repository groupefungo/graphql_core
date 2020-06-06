module GraphqlCore
  class Configuration
    attr_accessor :schema_execute, :graphql_route, :schema, :use_current_user_context

    def initialize
      @schema_execute = nil
      @graphql_route = nil
      @schema = nil
      @use_current_user_context = nil
    end
  end
end
