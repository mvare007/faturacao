# == Schema Information
#
# Table name: operation_products
#
#  id           :bigint           not null, primary key
#  quantity     :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discount_id  :bigint
#  operation_id :bigint           not null
#  product_id   :bigint           not null
#
# Indexes
#
#  index_operation_products_on_discount_id   (discount_id)
#  index_operation_products_on_operation_id  (operation_id)
#  index_operation_products_on_product_id    (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (discount_id => discounts.id)
#  fk_rails_...  (operation_id => operations.id)
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :operation_product do
    operation { nil }
    product { nil }
    quantity { "9.99" }
  end
end
