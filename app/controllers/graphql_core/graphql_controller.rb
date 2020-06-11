module GraphqlCore
  class GraphqlController < ApplicationController
    def execute
      variables      = ensure_hash(params[:variables])
      query          = params[:query]
      operation_name = params[:operationName]
      context        = {
          # current_user: current_user,
      }
      context[:current_user] = current_user if GraphqlCore.configuration.use_current_user_context

      transform_file_vars(variables)

      result         = GraphqlCore.configuration.schema_execute.call(query, variables, context)
      render json: result
    rescue => e
      raise e unless Rails.env.development?
      handle_error_in_development e
    end

    private

    def transform_file_vars(vars)
      vars.each do |k, v|
        if v.is_a?(ActionController::Parameters)
          transform_file_vars(v)
        else
          if v.is_a?(Array)
            vars[k] = v.map do |e|
              if e.is_a?(ApolloUploadServer::Wrappers::UploadedFile)
                e.__getobj__
              else
                e
              end
            end
          else
            if v.is_a?(ApolloUploadServer::Wrappers::UploadedFile)
              vars[k] = v.__getobj__
            end
          end
        end
      end
    end

    # Handle form data, JSON body, or a blank value
    def ensure_hash(ambiguous_param)
      case ambiguous_param
      when String
        if ambiguous_param.present?
          ensure_hash(JSON.parse(ambiguous_param))
        else
          {}
        end
      when Hash, ActionController::Parameters
        ambiguous_param
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
      end
    end

    def handle_error_in_development(e)
      logger.error e.message
      logger.error e.backtrace.join("\n")

      render json: {errors: [{message: e.message, backtrace: e.backtrace}], data: {}}, status: 500
    end
  end
end
