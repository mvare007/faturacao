# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :boolean
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  status          :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    admin { false }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
