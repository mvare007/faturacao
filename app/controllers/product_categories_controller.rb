class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: %i[show edit update destroy]

  def index
    authorize ProductCategory
    @product_categories = ProductCategory.all
  end

  def show
    authorize @product_category
  end

  def new
    authorize @product_category
    @product_category = ProductCategory.new
  end

  def create
    authorize @product_category
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to @product_category, notice: t(:created)
    else
      render :new
    end
  end

  def edit
    authorize @product_category
  end

  def update
    authorize @product_category
    if @product_category.update(product_category_params)
      redirect_to @product_category, notice: t(:updated)
    else
      render :edit
    end
  end

  def destroy
    authorize @product_category
    @product_category.destroy
    redirect_to product_categories_path, notice: t(:destroyed)
  end

  private

  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  def product_category_params
    params.require(:product_category).permit(:description, :key, :name)
  end
end
