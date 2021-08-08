# == Schema Information
#
# Table name: store_users
#
#  id               :bigint           not null, primary key
#  status           :string
#  store_admin      :boolean
#  store_supervisor :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  store_id         :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_store_users_on_store_id  (store_id)
#  index_store_users_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :store_user do
    user { nil }
    store { nil }
    store_admin { false }
    store_supervisor { "" }
    string { "MyString" }
  end
end
