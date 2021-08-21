# == Schema Information
#
# Table name: companies
#
#  id             :bigint           not null, primary key
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
class Company < ApplicationRecord
  audited

  # Associations
  has_many :company_users, dependent: :destroy
  has_many :company_products, dependent: :destroy
  has_many :discounts, dependent: :destroy
  has_many :operations, dependent: :restrict_with_error
  has_many :invoices, dependent: :restrict_with_error

  # Constants
  STATUSES = { active: 'active', inactive: 'inactive' }.freeze
  # TODO: Add activity types
  # ACTIVITY_TYPES {}.freeze

  # Delegates

  # Nested Attributes
  accepts_nested_attributes_for :company_users, allow_destroy: true
  accepts_nested_attributes_for :company_products, allow_destroy: true

  # Callbacks

  # Validations
  # TODO: activity_type validation
  validates :address, :zip_code, :location, :name, :nif, presence: true, length: { maximum: 120 }

  # Instance Methods
  def to_s
    name
  end

  def full_address
    "#{address} #{zip_code} #{location}"
  end
end
