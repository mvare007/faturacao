class CompanyProductsController < ApplicationController
  before_action :set_company_product, only: %i[show edit update destroy]

  def index
    authorize CompanyProduct
    @company_products = CompanyProduct.for_company(params[:company_id])
  end

  def show
    authorize @company_product
  end

  def new
    @company_product = CompanyProduct.new
    authorize @company_product
  end

  def create
    authorize @company_product
    @company_product = CompanyProduct.new(company_product_params)
    if @company_product.save
      redirect_to @company_product, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @company_product
  end

  def update
    authorize @company_product
    if @company_product.update(company_product_params)
      redirect_to @company_product, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @company_product
    @company_product.destroy
    redirect_to company_products_path, notice: t(:destroyed)
  end

  private

  def set_company_product
    @company_products = CompanyProduct.find(params[:id])
  end

  def company_product_params
    params.require(:company_product).permit(permitted_params)
  end

  def permitted_params
    %i[
      status
      stock
      target_stock
      product_id
    ]
  end
end
