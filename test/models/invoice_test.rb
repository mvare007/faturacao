# == Schema Information
#
# Table name: invoices
#
#  id            :bigint           not null, primary key
#  customer_name :string
#  customer_nif  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  operation_id       :bigint           not null
#  company_id      :bigint           not null
#  company_user_id :bigint           not null
#
# Indexes
#
#  index_invoices_on_operation_id        (operation_id)
#  index_invoices_on_company_id       (company_id)
#  index_invoices_on_company_user_id  (company_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (operation_id => operations.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (company_user_id => company_users.id)
#
require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
