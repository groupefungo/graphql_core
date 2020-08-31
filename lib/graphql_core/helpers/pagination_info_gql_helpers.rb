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
      total_count = objects.count
      unless connection_input.blank?
        has_next_page = total_count - connection_input[:first] > 0
        return {
            'hasNextPage'     => has_next_page,
            'hasPreviousPage' => false,
            'pagesCount'      => total_count / connection_input[:first],
            'remaining'       => has_next_page ? total_count - connection_input[:first] : 0,
            'total'           => total_count
        }
      end
      {
          'hasNextPage'     => false,
          'hasPreviousPage' => false,
          'pagesCount'      => 1,
          'remaining'       => 0,
          'total'           => total_count
      }
    end
  end
end
