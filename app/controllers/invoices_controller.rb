class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show destroy]

  def index
    authorize Invoice
    @invoices = Invoice.all
  end

  def show
    authorize @invoice
  end

  def new
    authorize @invoice
    @invoice = Invoice.new
    @invoice.invoice_products.build
  end

  def create
    authorize @invoice
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to @invoice, notice: t(:created)
    else
      render :new
    end
  end

  def destroy
    authorize @invoice
    @invoice.destroy
    redirect_to invoices_path, notice: t(:destroyed)
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(permitted_params, invoice_products_params)
  end

  def permitted_params
    %i[
      customer_name
      customer_nif
      operation_id
      company_id
      company_user_id
    ]
  end

  def invoice_products_params
    { invoice_products_attributes: %i[operation_product_id invoice_id _destroy] }
  end
end
