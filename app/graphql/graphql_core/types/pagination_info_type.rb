module GraphqlCore
  module Types
    class PaginationInfoType < GraphQL::Types::Relay::PageInfo
      field :pages_count, Int, description: 'Total of pages', null: false
      field :remaining, Int, description: 'Remaining nodes to fetch', null: false
      field :total, Int, description: 'Total of all nodes', null: false

      def pages_count
        if per_page
          total / per_page
        else
          1
        end
      end

      def remaining
        if per_page
          total > per_page - 1 ? total - per_page : 0
        else
          0
        end
      end

      def total
        object.nodes.size
      end

      protected

      def per_page
        object.first || object.last
      end
    end
  end
end
