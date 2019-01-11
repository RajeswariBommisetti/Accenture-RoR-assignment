module ExceptionHandler
  # provides the more graceful `included` method
  include Response
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ errors: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ errors: e }, :unprocessable_entity)
    end
  end
end
