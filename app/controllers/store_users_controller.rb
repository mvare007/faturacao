class StoreUsersController < ApplicationController
  before_action :set_store_user, only: %i[show edit update destroy]

  def index
    @store_users = StoreUser.for_store(params[:store_id])
  end

  def show
  end

  def new
    @store_user = StoreUser.new
  end

  def create
    @store_user = StoreUser.new(store_user_params)
    if @store_user.save
      redirect_to @store_user, notice: t(:created)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @store_user.update(store_user_params)
      redirect_to @store_user, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @store_user.destroy
    redirect_to store_users_path, notice: t(:destroyed)
  end

  private

  def set_store_user
    @store_users = StoreUser.find(params[:id])
  end

  def store_user_params
    params.require(:store_user).permit(permitted_params)
  end

  def permitted_params
    %i[
      status
      store_admin
      store_supervisor
    ]
  end
end
