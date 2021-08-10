class TaxesController < ApplicationController
  before_action :set_tax, only: %i[show edit update destroy]

  def index
    @taxes = Tax.all
  end

  def show
  end

  def new
    @tax = Tax.new
  end

  def create
    @tax = Tax.new(tax_params)
    if @tax.save
      redirect_to @tax, notice: t(:created)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tax.update(tax_params)
      redirect_to @tax, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    @tax.destroy
    redirect_to taxes_path, notice: t(:destroyed)
  end

  private

  def set_tax
    @tax = Tax.find(params[:id])
  end

  def tax_params
    params.require(:tax).permit(:name, :percentage)
  end
end
