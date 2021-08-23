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
FactoryBot.define do
  factory :company do
    name { "MyString" }
    nif { "MyString" }
    address { "MyString" }
    zip_code { "MyString" }
    location { "MyString" }
    license_number { "MyString" }
  end
end
