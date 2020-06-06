module GraphqlCore
  module Types
    class CoreMutationType < GraphqlCore::Types::BaseObject
      field :delete_node, mutation: GraphqlCore::Mutations::DeleteNodeMutation, null: false
    end
  end
end