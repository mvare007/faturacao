# == Schema Information
#
# Table name: discounts
#
#  id          :bigint           not null, primary key
#  description :string
#  end_date    :date
#  name        :string
#  percentage  :decimal(, )
#  start_date  :date
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  store_id    :bigint           not null
#
# Indexes
#
#  index_discounts_on_name      (name) UNIQUE
#  index_discounts_on_store_id  (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#
FactoryBot.define do
  factory :discount do
    percentage { "9.99" }
    name { "MyString" }
    expiry_date { "2021-08-08" }
  end
end
