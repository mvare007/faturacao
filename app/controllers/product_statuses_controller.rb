class ProductStatusesController < ApplicationController
  before_action :set_product_status, only: %i[show edit update destroy]

  def index
    @product_statuses = ProductStatus.all
  end

  def show
  end

  def new
    @product_status = ProductStatus.new
  end

  def create
    @product_status = ProductStatus.new(product_status_params)
    if @product_status.save
      redirect_to @product_status, notice: t(:created)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_status.update(product_status_params)
      redirect_to @product_status, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @product_status.destroy
    redirect_to product_statuses_path, notice: t(:destroyed)
  end

  private

  def set_product_status
    @product_status = ProductStatus.find(params[:id])
  end

  def product_status_params
    params.require(:product_status).permit(:name, :key)
  end
end
