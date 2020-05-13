GraphqlCore::Engine.routes.draw do
  post GraphqlCore::configuration.graphql_route || '/graphql', to: "graphql#execute"
end
