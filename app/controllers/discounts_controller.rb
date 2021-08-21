class DiscountsController < ApplicationController
  before_action :set_discount, only: %i[show edit update destroy]

  def index
    authorize Discount
    @discounts = Discount.all
  end

  def show
    authorize @discount
  end

  def new
    authorize @discount
    @discount = Discount.new
  end

  def create
    authorize @discount
    @discount = Discount.new(discount_params)
    if @discount.save
      redirect_to @discount, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @discount
  end

  def update
    authorize @discount
    if @discount.update(discount_params)
      redirect_to @discount, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @discount
    @discount.destroy
    redirect_to discounts_path, notice: t(:destroyed)
  end

  private

  def set_discount
    @discount = Discount.find(params[:id])
  end

  def discount_params
    params.require(:discount).permit(:name, :description, :percentage, :start_date, :end_date, :company_id)
  end
end
