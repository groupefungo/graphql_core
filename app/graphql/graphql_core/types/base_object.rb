module GraphqlCore
  module Types
    class BaseObject < GraphQL::Schema::Object
      # field_class Types::BaseField
      def format_datetime(d)
        format(d, '%Y-%m-%d %H:%M')
      end

      def format_date(d)
        format(d, '%Y-%m-%d')
      end

      def format_time(d)
        format(d, '%H:%M')
      end

      def format(d, format)
        if d.is_a?(String)
          return d
        end
        d.strftime(format)
      end
    end
  end
end
