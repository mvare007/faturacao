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
require "test_helper"

class StoreProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
