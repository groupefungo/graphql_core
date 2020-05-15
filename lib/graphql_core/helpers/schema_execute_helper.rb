module GraphqlCore
  module SchemaExecuteHelper

    ## SCHEMA_EXECUTE
    # A method helper to execute Schema query to provide errors response to your rspec tests
    #
    # ACCEPTED OPTIONS
    # :key => Symbol, Required, get data by key in response hash
    # :key2 => Symbol, Required for Mutation responses, in relation with :mutation
    # :edge_type => Boolean, Optional, gets nested key in hash for GraphQL Edges Types
    # :mutation => Boolean, Optional, gets nested :key2 in hash for GraphQL Mutation Types
    # :multiple => Boolean, Optional, in relation with :mutation, will only return :key
    # @author DAVID LAROCHELLE

    def schema_execute(query, variables, context, **options)
      ensure_options(options)
      @response = GraphqlCore.configuration.schema_execute.call(query, variables, context)
      # @response = GraphqlCore.configuration.schema.execute(query, {variables: variables, context: context})
      read_response
    end

    protected

    def ensure_options(options)
      if options[:multiple].nil?
        options[:multiple] = false
      end

      if options[:key].nil?
        print_errors("Please provide a key in options parameters for schema_execute method")
      end

      if !options[:key2].blank? and (options[:mutation].nil? or !options[:mutation])
        print_errors("Please set 'mutation' options key to true if you are using key2 option")
      end
      @options = options
    end

    def print_errors(message)
      pp "*****************************   schema_execute method errors   **********************************"
      puts message
      pp "*************************************************************************************************"
      message
    end

    def read_response
      if response_hash['errors']
        print_errors(response_hash['errors'][0]['message'])
      else
        if @options[:edge_type]
          return data[@options[:key]]['edges']
        else
          return @options[:mutation] ? data[@options[:key]][@options[:key2]] : data[@options[:key]]
        end
      end
    end

    def data
      @response_data ||= response_hash['data']
    end

    def response_hash
      @response_hash ||= @response.to_h
    end
  end
end
