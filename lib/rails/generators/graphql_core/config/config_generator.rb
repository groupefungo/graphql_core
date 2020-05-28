module GraphqlCore
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      def self.source_root
        @graphql_core_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def create_initializer_file
        template 'initializer.rb', File.join('config', 'initializers', 'graphql_core.rb')
      end
    end
  end
end