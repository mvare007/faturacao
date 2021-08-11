class OperationProductsController < ApplicationController
  before_action :set_operation_product, only: %i[show edit update destroy]

  def index
    authorize OperationProduct
    @operation_products = OperationProduct.for_operation(params[:operation_id])
  end

  def show
    authorize @operation_product
  end

  def new
    authorize @operation_product
    @operation_product = OperationProduct.new
  end

  def create
    authorize @operation_product
    @operation_product = OperationProduct.new(operation_product_params)
    if @operation_product.save
      redirect_to @operation_product, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @operation_product
  end

  def update
    authorize @operation_product
    if @operation_product.update(operation_product_params)
      redirect_to @operation_product, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @operation_product
    @operation_product.destroy
    redirect_to operation_products_path, notice: t(:destroyed)
  end

  private

  def set_operation_product
    @operation_products = OperationProduct.find(params[:id])
  end

  def operation_product_params
    params.require(:operation_product).permit(permitted_params)
  end

  def permitted_params
    # TODO: Check if it makes sense to change the operation_id
    %i[
      quantity
      discount_id
      product_id
    ]
  end
end
