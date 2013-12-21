class Api::V1::ApiController < ApplicationController

  attr_accessor :current_user

  before_filter :authenticate_current_user

  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from Exception, with: :error_500

  def index
    # Method for testing...
    render nothing: true
  end

  def authenticate_current_user
    self.current_user = User.find_by_token params[:token]
    return render_unauthorized if current_user.nil?
  end

  def render_api_errors(message, errors = [], status = :bad_request)
    render "api/v1/application/api_errors", formats: [:json], status: status, locals: {
      message: message,
      errors:  (errors.respond_to?(:full_messages)) ? errors.full_messages : errors
    }
  end

  def render_api_message(message, status = :ok)
    render "api/v1/application/api_message", formats: [:json], status: status, locals: {
      message: message
    }
  end

  def render_unauthorized
    render_api_errors t('api.error_title'), t('api.error_unauthorized'), :unauthorized
  end

  def error_not_found
    render_api_errors t('api.error_title'), t('api.error_not_found'), 404
  end

  def error_500(exception)
    if Rails.env.development? or Rails.env.test?
      raise exception # Catch and release!
    else
      ExceptionNotifier.notify_exception exception
      render_api_errors t('api.error_title'), t('api.error_500'), 500
    end
  end
end
