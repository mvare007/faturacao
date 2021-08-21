class CompanyUsersController < ApplicationController
  before_action :set_company_user, only: %i[show edit update destroy]

  def index
    authorize CompanyUser
    @company_users = CompanyUser.for_company(params[:company_id])
  end

  def show
    authorize @company_user
  end

  def new
    authorize @company_user
    @company_user = CompanyUser.new
  end

  def create
    authorize @company_user
    @company_user = CompanyUser.new(company_user_params)
    if @company_user.save
      redirect_to @company_user, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @company_user
  end

  def update
    authorize @company_user
    if @company_user.update(company_user_params)
      redirect_to @company_user, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @company_user
    @company_user.destroy
    redirect_to company_users_path, notice: t(:destroyed)
  end

  private

  def set_company_user
    @company_users = CompanyUser.find(params[:id])
  end

  def company_user_params
    params.require(:company_user).permit(permitted_params)
  end

  def permitted_params
    %i[
      status
      company_admin
      company_supervisor
    ]
  end
end
