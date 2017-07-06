module BaseAPI
  extend ActiveSupport::Concern

  included do
    prefix "api"
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    error_formatter :json, ErrorFormatter
    default_format :json

    rescue_from Grape::Exceptions::ValidationErrors do
      error!({error_code: 604, message: "Validation errors"}, 200)
    end

    rescue_from APIError::Base do |e|
      error!({error_code: 601, message: "BaseAPI Error"}, 200)
    end

    rescue_from ActiveRecord::UnknownAttributeError, ActiveRecord::RecordInvalid, ActiveRecord::StatementInvalid,
      JSON::ParserError do |e|
      error!({error_code: 600, message: "Data errors"}, 200)
    end

    rescue_from ActiveRecord::RecordNotFound do
      error!({error_code: 603, message: "Record not found"}, 200)
    end

    helpers do
      def authenticate!
        raise APIError::Unauthenticated unless current_user
      end

      def current_user
        @current_user ||= User.admin.rom_access_token access_token_header
      end

      def access_token_header
        headers["X-Revo-Access-Token"]
      end

      def pagination_dict object
        {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.prev_page,
          total_pages: object.total_pages,
          total_count: object.total_count
        }
      end
    end
  end
end
