class ApplicationController < ActionController::API
  ActionController::Parameters.include(Pipeable)
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found(exception)
    render json: {message: exception.message}, status: :not_found
  end
end
