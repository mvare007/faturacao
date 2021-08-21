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
class Operation < ApplicationRecord
  audited

  # Associations
  belongs_to :company
  belongs_to :company_user
  has_many :operation_products, dependent: :destroy
  has_many :invoices, dependent: :restrict_with_error

  # Delegates
  delegate :name, :nif, :address, :zip_code, :location, :license_number, to: :company, prefix: true, allow_nil: true
  delegate :user, to: :company_user, allow_nil: true

  # Nested Attributes
  accepts_nested_attributes_for :operation_products, allow_destroy: true

  # Callbacks

  # Validations
  validates :total, :total_tax, presence: true

  # Instance Methods
end
