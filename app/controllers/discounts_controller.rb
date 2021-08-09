class DiscountsController < ApplicationController
  before_action :set_discount, only: %i[show edit update destroy]

  def index
    @discounts = Discount.all
  end

  def show
  end

  def new
    @discount = Discount.new
  end

  def create
    @discount = Discount.new(discount_params)
    if @discount.save
      redirect_to @discount, notice: t(:created)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @discount.update(discount_params)
      redirect_to @discount, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @discount.destroy
    redirect_to discounts_path, notice: t(:destroyed)
  end

  private

  def set_discount
    @discount = Discount.find(params[:id])
  end

  def discount_params
    params.require(:discount).permit(:name, :description, :percentage, :start_date, :end_date, :store_id)
  end
end
