class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create login welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to sessions_new_path
    else
      redirect_to sessions_login_path
    end
  end

  def login
  end

  def logout
    sessions[:user_id] = nil
  end

  def welcome
  end

  def page_requires_login
  end
end

# https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
