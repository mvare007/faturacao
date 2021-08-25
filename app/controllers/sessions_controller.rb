class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = t(:login_invalid)
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_welcome_path
  end

  def welcome
  end
end

# https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
