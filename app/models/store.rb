# == Schema Information
#
# Table name: stores
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
class Store < ApplicationRecord
  # Associations
  has_many :store_users, dependent: :destroy
  has_many :store_products, dependent: :destroy
  has_many :discounts, dependent: :destroy
  has_many :sales, dependent: :restrict_with_error
  has_many :invoices, dependent: :restrict_with_error

  # Constants
  STATUSES = { active: 'active', inactive: 'inactive' }.freeze

  # Delegates

  # Nested Attributes
  accepts_nested_attributes_for :store_users, allow_destroy: true
  accepts_nested_attributes_for :store_products, allow_destroy: true

  # Callbacks

  # Validations
  validates :address, :zip_code, :location, :name, :nif, presence: true, length: { maximum: 120 }

  # Instance Methods
  def to_s
    name
  end

  def full_address
    "#{address} #{zip_code} #{location}"
  end
end
