class InvoiceProductsController < ApplicationController
  before_action :set_invoice_product, only: :show

  def index
    @invoice_products = InvoiceProduct.for_invoice(params[:invoice_id])
  end

  def show
  end

  private

  def set_invoice_product
    @invoice_product = InvoiceProduct.find(params[:id])
  end
end
