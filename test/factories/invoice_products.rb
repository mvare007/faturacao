# == Schema Information
#
# Table name: invoice_products
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  invoice_id      :bigint           not null
#  sale_product_id :bigint           not null
#
# Indexes
#
#  index_invoice_products_on_invoice_id       (invoice_id)
#  index_invoice_products_on_sale_product_id  (sale_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (invoice_id => invoices.id)
#  fk_rails_...  (sale_product_id => sale_products.id)
#
FactoryBot.define do
  factory :invoice_product do
    invoice { nil }
    product { nil }
    quantity { "9.99" }
  end
end
