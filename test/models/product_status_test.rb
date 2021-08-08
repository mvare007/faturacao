# == Schema Information
#
# Table name: product_statuses
#
#  id         :bigint           not null, primary key
#  key        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ProductStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
