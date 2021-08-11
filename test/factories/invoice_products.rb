# == Schema Information
#
# Table name: invoice_products
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  invoice_id      :bigint           not null
#  operation_product_id :bigint           not null
#
# Indexes
#
#  index_invoice_products_on_invoice_id       (invoice_id)
#  index_invoice_products_on_operation_product_id  (operation_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (invoice_id => invoices.id)
#  fk_rails_...  (operation_product_id => operation_products.id)
#
FactoryBot.define do
  factory :invoice_product do
    invoice { nil }
    product { nil }
    quantity { "9.99" }
  end
end
