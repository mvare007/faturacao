class StoreProductsController < ApplicationController
  before_action :set_store_product, only: %i[show edit update destroy]

  def index
    authorize StoreProduct
    @store_products = StoreProduct.for_store(params[:store_id])
  end

  def show
    authorize @store_product
  end

  def new
    @store_product = StoreProduct.new
    authorize @store_product
  end

  def create
    authorize @store_product
    @store_product = StoreProduct.new(store_product_params)
    if @store_product.save
      redirect_to @store_product, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @store_product
  end

  def update
    authorize @store_product
    if @store_product.update(store_product_params)
      redirect_to @store_product, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @store_product
    @store_product.destroy
    redirect_to store_products_path, notice: t(:destroyed)
  end

  private

  def set_store_product
    @store_products = StoreProduct.find(params[:id])
  end

  def store_product_params
    params.require(:store_product).permit(permitted_params)
  end

  def permitted_params
    %i[
      status
      stock
      target_stock
      product_id
    ]
  end
end
