module GraphqlCore
  module Types
    class BaseModelType < GraphQL::Schema::Object
      connection_type_class GraphqlCore::Connections::BaseConnection
      field_class GraphQL::Types::Relay::BaseField
      implements GraphqlCore::Interfaces::NodeInterface


    end
  end
end