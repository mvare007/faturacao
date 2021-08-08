# == Schema Information
#
# Table name: sales
#
#  id            :bigint           not null, primary key
#  total         :decimal(, )
#  total_tax     :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  store_id      :bigint           not null
#  store_user_id :bigint           not null
#
# Indexes
#
#  index_sales_on_store_id       (store_id)
#  index_sales_on_store_user_id  (store_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (store_user_id => store_users.id)
#
require "test_helper"

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
