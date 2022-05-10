module ErrorHandler
  extend ActiveSupport::Concern

  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActionController::ParameterMissing, with: :missing_parameters
      rescue_from StandardError do |e|
        unexpected_error(e)
      end
      rescue_from Errors::GenericError do |e|
        respond(e.status, e.message)
      end
    end
  end

  private

  def respond(status, message)
    render json: { mssg: message }, status: status
  end

  def missing_parameters
    respond(:unprocessable_entity, 'Incomplete parameters')
  end

  def unexpected_error(error)
    respond(:unprocessable_entity, 'Unexpected error')
  end
end