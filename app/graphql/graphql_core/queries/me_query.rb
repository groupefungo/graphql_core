module GraphqlCore
  module Queries
    class MeQuery < Queries::BaseQuery
      type Interfaces::NodeInterface, null: false

      description 'Find current user'

      def resolve
        context[:current_user]
      end
    end
  end
end