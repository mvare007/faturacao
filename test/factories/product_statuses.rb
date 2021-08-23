# == Schema Information
#
# Table name: product_statuses
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_product_statuses_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :product_status do
    name { "MyString" }
    key { "MyString" }
  end
end
