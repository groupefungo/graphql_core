module GraphqlCore
  module Mutations
    class DeleteNodeMutation < BaseMutation
      field :success, Boolean, null: false
      argument :gid, ID, required: true

      def resolve(gid:)
        begin
          node = GlobalID::Locator.locate(gid)
          {success: node.destroy!}
        rescue ActiveRecord::RecordInvalid => invalid
          GraphQL::ExecutionError.new(
              {
                  errors: invalid.record.errors.messages
              }
          )
        end
      end
    end
  end
end