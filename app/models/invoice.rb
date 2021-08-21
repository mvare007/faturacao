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
class Invoice < ApplicationRecord
  # Associations
  belongs_to :operation
  belongs_to :company
  belongs_to :company_user
  has_many :invoice_products, dependent: :destroy

  # Delegates
  delegate :name, :nif, :address, :zip_code, :location, :license_number, to: :company, prefix: true, allow_nil: true
  with_options allow_nil: true do
    delegate :total, :total_tax, to: :operation
    delegate :user, to: :company_user
  end

  # Callbacks

  # Validations
  validates :customer_nif, presence: true
  validates :customer_name, length: { maximum: 120 }

  # Instance Methods

  # private

  # Instance Private Methods
end
