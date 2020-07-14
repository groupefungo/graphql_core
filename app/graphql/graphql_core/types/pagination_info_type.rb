module GraphqlCore
  module Types
    class PaginationInfoType < GraphQL::Types::Relay::PageInfo
      field :pages_count, Int, null: false,
          description: 'The total of pages'

      field :remaining, Int, null: false,
          description: 'Remaining nodes to fetch'

      field :total, Int, null: false,
          description: 'Total of all nodes'

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
        first || last
      end

      def first
        object.respond_to?(:first) ? object.first : object.arguments[:first]
      end

      def last
        object.respond_to?(:last) ? object.last : object.arguments[:last]
      end
    end
  end
end
