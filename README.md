# GraphQL::Core
## Installation

Une fois GraphQL installé dans votre application

Ajouter cette ligne à votre Gemfile
```ruby
gem 'graphql_core'
```

Exécuter:

    $ bundle install

Exécuter:
    
    $ rails g graphql_core:config
    
Ceci créera un initializer dans config/initializers puis modifier 

config/initializers/graphql_core

```ruby
GraphqlCore.configure do |config|
  config.graphql_route = '/custom_endpoint' ## par défaut '/graphql' 
  config.schema_execute = ->(query, variables, context) {
    YourGraphQLSchema.execute(query, variables: variables, context: context) # vous retrouverez cette méthode dans le graphql_controller de votre application
  }
end
```
    

## Documentation

TODO: Coming Soon

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).