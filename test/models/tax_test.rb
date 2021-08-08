# == Schema Information
#
# Table name: taxes
#
#  id         :bigint           not null, primary key
#  name       :string
#  percentage :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_taxes_on_name  (name) UNIQUE
#
require "test_helper"

class TaxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
