# == Schema Information
#
# Table name: store_products
#
#  id           :bigint           not null, primary key
#  status       :string
#  stock        :decimal(, )
#  target_stock :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_id   :bigint           not null
#  store_id     :bigint           not null
#
# Indexes
#
#  index_store_products_on_product_id  (product_id)
#  index_store_products_on_store_id    (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (store_id => stores.id)
#
FactoryBot.define do
  factory :store_product do
    store { nil }
    product { nil }
    stock { "9.99" }
    target_stock { "9.99" }
  end
end
