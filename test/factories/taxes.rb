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
FactoryBot.define do
  factory :tax do
    name { "MyString" }
    value { "9.99" }
  end
end
