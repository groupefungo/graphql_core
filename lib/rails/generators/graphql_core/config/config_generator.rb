module GraphqlCore
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      def self.source_root
        @graphql_core_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def create_initializer_file
        template 'initializer.rb', File.join('config', 'initializers', 'graphql_core.rb')
      end

      # def add_global_id_node_query_to_query_type
      #   query_type_file   = 'app/graphql/types/core_query_type.rb'
      #   query_types_path  = File.join(destination_root, query_type_file)
      #   field_row_comment = '  ## GRAPHQL CORE QUERIES'
      #   field_row         = '  field :node, resolver: GraphqlCore::Queries::GlobalIdNodeQuery, null: false'
      #   starting_line     = 'class QueryType < Types::BaseObject'
      #   if File.exist?(query_types_path)
      #     current_route = parse_file_for_line(query_types_path, field_row)
      #     if current_route.present?
      #       say_status('skipped', "Field already exist in query_type")
      #     else
      #       insert_text_after_line(query_types_path, starting_line, field_row)
      #       insert_text_after_line(query_types_path, starting_line, field_row_comment)
      #     end
      #   else
      #     say_status('skipped', "#{query_type_file} not found. Add \"#{query_type_file}\" to graphql.")
      #   end
      template 'initializer.rb', File.join('config', 'initializers', 'graphql_core.rb')
      # end
      #
      # private
      #
      # def insert_text_after_line(filename, line, str)
      #   gsub_file(filename, /(#{Regexp.escape(line)})/mi) do |match|
      #     "#{match}\n  #{str}"
      #   end
      # end
      #
      # def replace_line(filename, old_line, new_line)
      #   gsub_file(filename, /(#{Regexp.escape(old_line)})/mi, "  #{new_line}")
      # end
      #
      # def parse_file_for_line(filename, str)
      #   match = false
      #
      #   File.open(filename) do |f|
      #     f.each_line do |line|
      #       match = line if line =~ /(#{Regexp.escape(str)})/mi
      #     end
      #   end
      #   match
      # end
    end
  end
end