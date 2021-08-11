# == Schema Information
#
# Table name: operation_products
#
#  id          :bigint           not null, primary key
#  quantity    :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  discount_id :bigint
#  product_id  :bigint           not null
#  operation_id     :bigint           not null
#
# Indexes
#
#  index_operation_products_on_discount_id  (discount_id)
#  index_operation_products_on_product_id   (product_id)
#  index_operation_products_on_operation_id      (operation_id)
#
# Foreign Keys
#
#  fk_rails_...  (discount_id => discounts.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (operation_id => operations.id)
#
require "test_helper"

class OperationProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
