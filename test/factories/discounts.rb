# == Schema Information
#
# Table name: discounts
#
#  id          :bigint           not null, primary key
#  description :string
#  expiry_date :date
#  name        :string
#  percentage  :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_discounts_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :discount do
    percentage { "9.99" }
    name { "MyString" }
    expiry_date { "2021-08-08" }
  end
end
