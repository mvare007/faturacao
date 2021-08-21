class OperationsController < ApplicationController
  before_action :set_operation, only: %i[show edit update destroy]

  def index
    authorize Operation
    @operations = Operation.all
  end

  def show
    authorize @operation
  end

  def new
    authorize @operation
    @operation = Operation.new
    @operation.operation_products.build
  end

  def create
    authorize @operation
    @operation = Operation.new(operation_params)
    if @operation.save
      redirect_to @operation, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @operation
    @operation.operation_products.build if @operation.operation_products.blank?
  end

  def update
    authorize @operation
    if @operation.update(operation_params)
      redirect_to @operation, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @operation
    @operation.destroy
    redirect_to operations_path, notice: t(:destroyed)
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(permitted_params, operation_product_params)
  end

  def permitted_params
    %i[
      total
      company_id
      company_user_id
    ]
  end

  def operation_product_params
    { operation_products_attributes: %i[quantity discount_id product_id operation_id _destroy] }
  end
end
