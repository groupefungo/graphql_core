module GraphqlCore
  module Types
    module Calendar
      class DayType < BaseObject
        field :date, GraphQL::Types::ISO8601Date, null: false
        field :date_string, String, null: false
        field :day_of_week, Int, null: false
        field :is_weekend, Boolean, null: false
        field :hours, [Types::Calendar::HourType], null: false
        field :month, Int, null: false
        field :month_name, String, null: false
        field :week_day, Int, null: false
        field :week_day_name, String, null: false

        def date
          object
        end

        def date_string
          object.strftime("%B %d")
        end

        def day_of_week
          object.day
        end

        def hours
          hours_full_range.step(1.hour).map do |date|
            pp date
            Time.at(date)
          end
        end

        def is_weekend
          object.saturday? || object.sunday?
        end

        def month
          object.month
        end

        def month_name
          object.strftime('%B')
        end

        def week_day
          object.wday
        end

        def week_day_name
          # I18n.t(Date::DAYNAMES[object.wday])
          object.strftime("%A")
        end

        private

        def hours_full_range
          object.beginning_of_day.to_i..object.end_of_day.to_i
        end
      end
    end
  end
end