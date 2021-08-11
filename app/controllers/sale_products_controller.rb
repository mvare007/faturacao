class SaleProductsController < ApplicationController
  before_action :set_sale_product, only: %i[show edit update destroy]

  def index
    authorize SaleProduct
    @sale_products = SaleProduct.for_sale(params[:sale_id])
  end

  def show
    authorize @sale_product
  end

  def new
    authorize @sale_product
    @sale_product = SaleProduct.new
  end

  def create
    authorize @sale_product
    @sale_product = SaleProduct.new(sale_product_params)
    if @sale_product.save
      redirect_to @sale_product, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @sale_product
  end

  def update
    authorize @sale_product
    if @sale_product.update(sale_product_params)
      redirect_to @sale_product, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @sale_product
    @sale_product.destroy
    redirect_to sale_products_path, notice: t(:destroyed)
  end

  private

  def set_sale_product
    @sale_products = SaleProduct.find(params[:id])
  end

  def sale_product_params
    params.require(:sale_product).permit(permitted_params)
  end

  def permitted_params
    # TODO: Check if it makes sense to change the sale_id
    %i[
      quantity
      discount_id
      product_id
    ]
  end
end
