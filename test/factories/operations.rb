# == Schema Information
#
# Table name: operations
#
#  id            :bigint           not null, primary key
#  total         :decimal(, )
#  total_tax     :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  store_id      :bigint           not null
#  store_user_id :bigint           not null
#
# Indexes
#
#  index_operations_on_store_id       (store_id)
#  index_operations_on_store_user_id  (store_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (store_user_id => store_users.id)
#
FactoryBot.define do
  factory :operation do
    store_user { nil }
    store { nil }
    total { "9.99" }
    total_tax { "9.99" }
    discount { nil }
  end
end
