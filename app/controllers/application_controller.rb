class ApplicationController < ActionController::Base
  include Pundit

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def authorized
    redirect_to login_path, alert: t(:please_login) unless logged_in?
  end

  def user_not_authorized
    policy_name = exception.policy.class.to_s.underscore

    redirect_to root_path, alert: t("#{policy_name}.#{exception.query}", scope: "pundit", default: :default)
  end
end
