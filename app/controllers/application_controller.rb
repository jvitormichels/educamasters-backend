class ApplicationController < ActionController::API
  rescue_from ApplicationError, with: :render_error_response

  def render_error_response(exception)
    render json: { code: exception.error, message: exception.message }, status: exception.status_code
  end
end
