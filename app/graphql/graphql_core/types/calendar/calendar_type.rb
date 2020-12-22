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
          date
        end

        def days_of_month
          month_range
        end

        def days_of_week
          week_range
        end

        def month
          date.month
        end

        def month_name
          date.strftime('%B')
        end

        def week_day_names
          Date::DAYNAMES.map { |day_name| I18n.t(day_name) }
        end

        def year
          date.year
        end

        protected

        def month_range
          @month_range ||= (date.beginning_of_month.beginning_of_week(:sunday)..date.end_of_month.end_of_week(:sunday)).to_a
        end

        def week_range
          @week_range ||= (date.beginning_of_week(:sunday)..date.end_of_week(:sunday)).to_a
        end

        def date
          object[:date]
        end
      end
    end
  end
end