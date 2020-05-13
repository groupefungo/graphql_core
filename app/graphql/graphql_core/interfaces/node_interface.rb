module GraphqlCore
  module Interfaces
    module NodeInterface
      include BaseInterface
      include GlobalID::Identification

      description('A node. The base off all types.')

      field :id, ID, 'The node\'s id', null: true
      field :gid, ID, 'The node\'s global id', null: true
      field :created_at, String, 'The Datetime the node has been created', null: false
      field :updated_at, String, 'The Datetime the node has been updated', null: false

      def gid
        object.to_gid_param
      end
    end
  end
end
