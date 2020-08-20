module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField

    def format_date(d)
      format(d, '%Y-%m-%d')
    end
  end
end
