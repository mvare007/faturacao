# == Schema Information
#
# Table name: company_users
#
#  id         :bigint           not null, primary key
#  role       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_company_users_on_company_id  (company_id)
#  index_company_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CompanyUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
