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
FactoryBot.define do
  factory :product_status do
    name { "MyString" }
    key { "MyString" }
  end
end
