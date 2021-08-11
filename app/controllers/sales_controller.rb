class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]

  def index
    authorize Sale
    @sales = Sale.all
  end

  def show
    authorize @sale
  end

  def new
    authorize @sale
    @sale = Sale.new
    @sale.sale_products.build
  end

  def create
    authorize @sale
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @sale
    @sale.sale_products.build if @sale.sale_products.blank?
  end

  def update
    authorize @sale
    if @sale.update(sale_params)
      redirect_to @sale, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @sale
    @sale.destroy
    redirect_to sales_path, notice: t(:destroyed)
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(permitted_params, sale_product_params)
  end

  def permitted_params
    %i[
      total
      store_id
      store_user_id
    ]
  end

  def sale_product_params
    { sale_products_attributes: %i[quantity discount_id product_id sale_id _destroy] }
  end
end
