# == Schema Information
#
# Table name: company_products
#
#  id           :bigint           not null, primary key
#  status       :string
#  stock        :decimal(, )
#  target_stock :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null
#  product_id   :bigint           not null
#
# Indexes
#
#  index_company_products_on_company_id  (company_id)
#  index_company_products_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (product_id => products.id)
#
require "test_helper"

class CompanyProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
