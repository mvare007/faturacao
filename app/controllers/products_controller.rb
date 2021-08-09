class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: t(:created)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: t(:destroyed)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product)
          .permit(:name, :unit_price, :code, :description, :product_category_id, :product_status_id, :tax_id)
  end
end
