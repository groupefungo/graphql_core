module GraphqlCore
  module Queries
    class GlobalIdNodesQuery < BaseQuery
      type [Interfaces::NodeInterface], null: true

      argument :gids, [ID], required: true # GLOBAL ID

      def resolve(gids:)
        GlobalID::Locator.locate_many(gids)
      end
    end
  end
end