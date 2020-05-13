module GraphqlCore
  module Types
    class CoreQueryType < GraphqlCore::Types::BaseObject
      field :node, resolver: GraphqlCore::Queries::GlobalIdNodeQuery, null: false
    end
  end
end
