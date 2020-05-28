module GraphqlCore
  module PaginationInfoGqlHelpers
    def page_info_fragment
      <<-QUERY
fragment PageInfoFragment on PaginationInfo {
  hasNextPage
  hasPreviousPage
  pagesCount
  remaining
  total
}
      QUERY
    end

    def page_info_fragment_response(objects, **connection_input)
      unless connection_input.blank?
        total_count = objects&.first.class.all.count

        return {
            'hasNextPage'     => total_count - connection_input[:first] > 0,
            'hasPreviousPage' => false,
            'pagesCount'      => total_count / connection_input[:first],
            'remaining'       => total_count - connection_input[:first],
            'total'           => total_count
        }
      end
      {
          'hasNextPage'     => false,
          'hasPreviousPage' => false,
          'pagesCount'      => 1,
          'remaining'       => 0,
          'total'           => objects.size
      }
    end
  end
end
