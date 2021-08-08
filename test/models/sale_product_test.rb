# == Schema Information
#
# Table name: sale_products
#
#  id          :bigint           not null, primary key
#  quantity    :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  discount_id :bigint
#  product_id  :bigint           not null
#  sale_id     :bigint           not null
#
# Indexes
#
#  index_sale_products_on_discount_id  (discount_id)
#  index_sale_products_on_product_id   (product_id)
#  index_sale_products_on_sale_id      (sale_id)
#
# Foreign Keys
#
#  fk_rails_...  (discount_id => discounts.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (sale_id => sales.id)
#
require "test_helper"

class SaleProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
