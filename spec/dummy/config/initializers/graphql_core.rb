require 'graphql_core'
GraphqlCore.configure do |config|
  config.graphql_route = '/graphql'
  config.schema_execute = ->(query, variables, context) {
    DummySchema.execute(query, variables: variables, context: context) # vous retrouverez cette méthode dans le graphql_controller de votre application
  }
end