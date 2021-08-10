class StoresController < ApplicationController
  before_action :set_store, only: %i[show edit update destroy]

  def index
    @stores = Store.all
  end

  def show
  end

  def new
    @store = Store.new
    @store.store_products.build
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to @store, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    @store.store_products.build if @store.store_products.blank?
  end

  def update
    if @store.update(store_params)
      redirect_to @store, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice: t(:destroyed)
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(permitted_params, store_products_params, store_user_params)
  end

  def permitted_params
    %i[
      name
      nif
      license_number
      address
      zip_code
      location
      status
    ]
  end

  def store_products_params
    { store_products_attributes: %i[stock target_stock status _destroy] }
  end

  def store_user_params
    { store_user_attributes: %i[store_admin store_supervisor status store_id user_id] }
  end
end
