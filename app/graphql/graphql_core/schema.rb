module GraphqlCore
  class Schema < GraphQL::Schema
    # mutation(GraphqlCore::Types::MutationType)
    # query(GraphqlCore::Types::CoreQueryType)

    # Add built-in connections for pagination
    use GraphQL::Pagination::Connections

    def self.resolve_type(type, object, context)
      type_resolver = if (resolver = GraphqlCore.configuration.type_resolver && GraphqlCore.configuration.type_resolver.call(type, object, context))
                        resolver
                      else
                        "Types::#{object.class.name}Type"
                      end
      type_resolver.constantize
    end
  end
end
