# == Schema Information
#
# Table name: companies
#
#  id             :bigint           not null, primary key
#  activity_type  :string
#  address        :string
#  license_number :string
#  location       :string
#  name           :string
#  nif            :string
#  status         :string
#  zip_code       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
