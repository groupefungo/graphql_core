module GraphqlCore
  module Types
    module Calendar
      class HourType < BaseObject
        field :time, String, null: false
        field :datetime, GraphQL::Types::ISO8601DateTime, null: false
        field :formatted_datetime, String, null: false

        def datetime
          object
        end

        def formatted_datetime
          format_datetime(datetime)
        end

        def time
          object.strftime("%l:%M %p")
        end
      end
    end
  end
end