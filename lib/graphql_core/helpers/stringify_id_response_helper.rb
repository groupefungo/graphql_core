module GraphqlCore
  module StringifyIdResponseHelper
    # USED FOR PARSING ID INTO GRAPHQL RESPONSES
    # WILL RETURN ID OR NIL IF OBJECT IS PERSISTED OR NOT
    # David L.
    def stringify_id(ids)
      if ids.is_a?(Array)
        return ids.map(&:to_s)
      end
      ids ? ids.to_s : nil
    end
  end
end