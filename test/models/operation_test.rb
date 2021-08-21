# == Schema Information
#
# Table name: operations
#
#  id            :bigint           not null, primary key
#  total         :decimal(, )
#  total_tax     :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  company_id      :bigint           not null
#  company_user_id :bigint           not null
#
# Indexes
#
#  index_operations_on_company_id       (company_id)
#  index_operations_on_company_user_id  (company_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (company_user_id => company_users.id)
#
require "test_helper"

class OperationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
