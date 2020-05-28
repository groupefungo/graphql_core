GraphqlCore.configure do |config|
  config.graphql_route = '/custom_endpoint' ## par défaut '/graphql'
  config.schema_execute = ->(query, variables, context) {
    YourGraphQLSchema.execute(query, variables: variables, context: context) # vous retrouverez cette méthode dans le graphql_controller de votre application
  }
end