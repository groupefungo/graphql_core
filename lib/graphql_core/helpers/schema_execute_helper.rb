module GraphqlCore
  module SchemaExecuteHelper

    ## SCHEMA_EXECUTE
    # A method helper to execute Schema query to provide errors response to your rspec tests
    #
    # ACCEPTED OPTIONS
    # :key => Symbol, Required, get data by key in response hash
    # :key2 => Symbol, Required for Mutation responses, in relation with :mutation Boolean
    # :edge_type => Boolean, Optional, gets nested key in hash for GraphQL Edges Types
    # :mutation => Boolean, Optional, gets nested :key2 in hash for GraphQL Mutation Types
    # @author DAVID LAROCHELLE

    def schema_execute(query, variables, context, **options)
      if options[:key].nil?
        print_errors("Please provide a key in options parameters for schema_execute method")
      end

      if !options[:key2].blank? and (options[:mutation].nil? or !options[:mutation])
        print_errors("Please set 'mutation' options key to true if you are using key2 option")
      end

      response = GraphqlCore.configuration.schema_execute.call(query, variables, context)
      hash     = response.to_h

      if hash['errors']
        print_errors(hash['errors'][0]['message'])
      else
        data = response['data']
        if options[:edge_type]
          return data[options[:key]]['edges']
        else
          return options[:mutation] ? response['data'][options[:key]][options[:key2]] : response['data'][options[:key]]
        end
      end
    end

    def print_errors(message)
      pp "*****************************   schema_execute method errors   **********************************"
      puts message
      pp "*************************************************************************************************"
      message
    end
  end
end
