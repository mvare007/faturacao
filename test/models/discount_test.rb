# == Schema Information
#
# Table name: discounts
#
#  id          :bigint           not null, primary key
#  description :string
#  end_date    :date
#  name        :string
#  percentage  :decimal(, )
#  start_date  :date
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint           not null
#
# Indexes
#
#  index_discounts_on_company_id  (company_id)
#  index_discounts_on_name        (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require "test_helper"

class DiscountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
