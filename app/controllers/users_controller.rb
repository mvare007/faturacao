class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    authorize User
    @users = User.all
  end

  def show
    authorize @user
  end

  def new
    authorize User
    @user = User.new
  end

  def create
    authorize @user
    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to root_path, notice: t(:created)
    else
      flash.now[:alert] = t(:error)
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to @user, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, notice: t(:destroyed)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :admin, :username, :password)
  end
end
