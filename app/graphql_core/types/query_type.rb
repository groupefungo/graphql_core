module GraphqlCore
  module Types
    class QueryType < Types::BaseObject
      ## GRAPHQL CORE QUERIES
      field :node, resolver: GraphqlCore::Queries::GlobalIdNodeQuery, null: false
    end
  end
end
