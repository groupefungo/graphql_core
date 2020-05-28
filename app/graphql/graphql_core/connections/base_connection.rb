require 'graphql'
module GraphqlCore
  module Connections
    class BaseConnection < GraphQL::Types::Relay::BaseConnection
      field :page_info, Types::PaginationInfoType, null: false
    end
  end
end
