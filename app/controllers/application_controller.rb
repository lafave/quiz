class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  # @return [Quiz, nil]
  def default_quiz
    view_context.default_quiz
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end
end
