class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    authorize Company
    @companies = Company.all
  end

  def show
    authorize @company
  end

  def new
    authorize Company
    @company = Company.new
    @company.company_products.build
  end

  def create
    authorize Company
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @company
    @company.company_products.build if @company.company_products.blank?
  end

  def update
    authorize @company
    if @company.update(company_params)
      redirect_to @company, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @company
    @company.destroy
    redirect_to companies_path, notice: t(:destroyed)
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(permitted_params, company_products_params, company_user_params)
  end

  def permitted_params
    %i[
      name
      nif
      license_number
      address
      zip_code
      location
      status
    ]
  end

  def company_products_params
    { company_products_attributes: %i[stock target_stock status _destroy] }
  end

  def company_user_params
    { company_user_attributes: %i[company_admin company_supervisor status company_id user_id] }
  end
end
