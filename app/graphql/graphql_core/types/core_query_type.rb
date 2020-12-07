module GraphqlCore
  module Types
    class CoreQueryType < GraphqlCore::Types::BaseObject
      field :node, resolver: GraphqlCore::Queries::GlobalIdNodeQuery, null: false
      field :nodes, resolver: GraphqlCore::Queries::GlobalIdNodesQuery, null: false
      field :me, resolver: GraphqlCore::Queries::MeQuery, null: false
    end
  end
end
