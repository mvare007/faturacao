# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  description :text
#  key         :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :product_category do
    name { "MyString" }
    key { "MyString" }
    description { "MyText" }
  end
end
