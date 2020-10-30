module GraphqlCore
  module Types
    module Calendar
      class CalendarType < BaseObject
        field :day, Types::Calendar::DayType, null: false
        field :days_of_month, [Types::Calendar::DayType], null: false
        field :days_of_week, [Types::Calendar::DayType], null: false
        field :month, Int, null: false
        field :month_name, String, null: false
        field :week_day, Int, null: false
        field :week_day_names, [String], null: false
        field :year, Int, null: false

        def day
          object
        end

        def days_of_month
          month_range
        end

        def days_of_week
          week_range
        end

        def month
          object.month
        end

        def month_name
          object.strftime('%B')
        end

        def week_day_names
          Date::DAYNAMES.map { |day_name| I18n.t(day_name) }
        end

        def year
          object.year
        end

        protected

        def month_range
          @month_range ||= (object.beginning_of_month.beginning_of_week(:sunday)..object.end_of_month.end_of_week(:sunday)).to_a
        end

        def week_range
          @week_range ||= (object.beginning_of_week(:sunday)..object.end_of_week(:sunday)).to_a
        end
      end
    end
  end
end