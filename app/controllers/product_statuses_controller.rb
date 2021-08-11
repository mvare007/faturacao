class ProductStatusesController < ApplicationController
  before_action :set_product_status, only: %i[show edit update destroy]

  def index
    authorize ProductStatus
    @product_statuses = ProductStatus.all
  end

  def show
    authorize @product_status
  end

  def new
    authorize @product_status
    @product_status = ProductStatus.new
  end

  def create
    authorize @product_status
    @product_status = ProductStatus.new(product_status_params)
    if @product_status.save
      redirect_to @product_status, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @product_status
  end

  def update
    authorize @product_status
    if @product_status.update(product_status_params)
      redirect_to @product_status, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @product_status
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
