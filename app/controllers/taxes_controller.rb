class TaxesController < ApplicationController
  before_action :set_tax, only: %i[show edit update destroy]

  def index
    authorize Tax
    @taxes = Tax.all
  end

  def show
    authorize @tax
  end

  def new
    authorize @tax
    @tax = Tax.new
  end

  def create
    authorize @tax
    @tax = Tax.new(tax_params)
    if @tax.save
      redirect_to @tax, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @tax
  end

  def update
    authorize @tax
    if @tax.update(tax_params)
      redirect_to @tax, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @tax
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
