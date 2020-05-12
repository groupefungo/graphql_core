module GraphqlCore
  class Configuration
    attr_accessor :schema_execute, :schema, :type_resolver

    def initialize
      @schema = nil
      @schema_execute = nil
      @type_resolver = nil
    end
  end
end
