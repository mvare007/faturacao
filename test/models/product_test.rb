# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  code                :string
#  name                :string
#  unit_price          :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :bigint
#  product_status_id   :bigint           not null
#  tax_id              :bigint           not null
#
# Indexes
#
#  index_products_on_product_category_id  (product_category_id)
#  index_products_on_product_status_id    (product_status_id)
#  index_products_on_tax_id               (tax_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_category_id => product_categories.id)
#  fk_rails_...  (product_status_id => product_statuses.id)
#  fk_rails_...  (tax_id => taxes.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
