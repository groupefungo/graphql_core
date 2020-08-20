module GraphqlCore
  module Types
    module Calendar
      class DayType < BaseObject
        field :date, GraphQL::Types::ISO8601Date, null: false
        field :date_string, String, null: false
        field :day_of_week, Int, null: false
        field :week_day, String, null: false

        def date
          object
        end

        def date_string
          object.strftime("%B %d")
        end

        def day_of_week
          object.day
        end

        def week_day
          # I18n.t(Date::DAYNAMES[object.wday])
          object.strftime("%A")
        end
      end
    end
  end
end