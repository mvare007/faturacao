class SalesController < ApplicationController
  before_create :set_sale, only: %i[show edit update destroy]

  def index
    @sales = Sale.all
  end

  def show
  end

  def new
    @sale = Sale.new
    @sale.sale_products.build
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    @sale.sale_products.build if @sale.sale_products.blank?
  end

  def update
    if @sale.update(sale_params)
      redirect_to @sale, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @sale.destroy
    redirect_to sales_path, notice: t(:destroyed)
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale)
          .permit(
            :total,
            :total_tax,
            :store_id,
            :store_user_id,
            sale_products_attributes: %i[quantity discount_id product_id sale_id _destroy]
          )
  end
end
