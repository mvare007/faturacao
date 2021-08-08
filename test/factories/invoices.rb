# == Schema Information
#
# Table name: invoices
#
#  id            :bigint           not null, primary key
#  customer_name :string
#  customer_nif  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  sale_id       :bigint           not null
#  store_id      :bigint           not null
#  store_user_id :bigint           not null
#
# Indexes
#
#  index_invoices_on_sale_id        (sale_id)
#  index_invoices_on_store_id       (store_id)
#  index_invoices_on_store_user_id  (store_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (sale_id => sales.id)
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (store_user_id => store_users.id)
#
FactoryBot.define do
  factory :invoice do
    customer_nif { "MyString" }
    customer_name { "MyString" }
    sale { nil }
    store { nil }
    store_user { nil }
  end
end
