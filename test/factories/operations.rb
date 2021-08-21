# == Schema Information
#
# Table name: operations
#
#  id            :bigint           not null, primary key
#  total         :decimal(, )
#  total_tax     :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  company_id      :bigint           not null
#  company_user_id :bigint           not null
#
# Indexes
#
#  index_operations_on_company_id       (company_id)
#  index_operations_on_company_user_id  (company_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (company_user_id => company_users.id)
#
FactoryBot.define do
  factory :operation do
    company_user { nil }
    company { nil }
    total { "9.99" }
    total_tax { "9.99" }
    discount { nil }
  end
end
