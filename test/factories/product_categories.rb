# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_product_categories_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :product_category do
    name { "MyString" }
    key { "MyString" }
    description { "MyText" }
  end
end
