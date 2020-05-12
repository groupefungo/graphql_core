module GraphqlCore
  module Queries
    class GlobalIdNodeQuery < BaseQuery
      type Interfaces::NodeInterface, null: true

      argument :gid, ID, required: true # GLOBAL ID

      def resolve(gid:)
        GlobalID::Locator.locate(gid)
      end
    end
  end
end