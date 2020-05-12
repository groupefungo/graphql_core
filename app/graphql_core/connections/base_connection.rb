require 'graphql'
module GraphqlCore
  module Connections
    class BaseConnection < ::GraphQL::Types::Relay::BaseConnection

      field :pages_count, Int, description: 'Total of pages', null: false
      field :remaining, Int, description: 'Remaining nodes to fetch', null: false
      field :total, Int, description: 'Total of all nodes', null: false

      def pages_count
        total / object.first
      end

      def remaining
        total > object.first - 1 ? total - object.first : 0
      end

      def total
        object.items.size
      end
    end
  end
end
