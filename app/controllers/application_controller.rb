class ApplicationController < ActionController::Base
  before_action :require_login

  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

  private

  def require_login
    unless (logged_in?)
      if admin?
        flash[:danger] = "Доступ запрещен. Пожалуйста, войдите"
        redirect_to admin_path
      end
    end
  end
end
