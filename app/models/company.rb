# == Schema Information
#
# Table name: companies
#
#  id             :bigint           not null, primary key
#  activity_type  :string
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
  # ACTIVITY_TYPES = {}.freeze

  # Delegates

  # Nested Attributes
  accepts_nested_attributes_for :company_users, allow_destroy: true
  accepts_nested_attributes_for :company_products, allow_destroy: true

  # Callbacks
  after_initialize :init, if: :new_record?
  after_create :create_store_admin

  # Scopes
  scope :actives, -> { where(status: STATUSES.fetch(:active)) }
  scope :for_admin, -> { includes(:company_users).where(company_users: { role: CompanyUser::ROLES.fetch(:admin) }) }
  scope :acessible_by, ->(user) { where(id: user.company_users.pluck(:company_id)) }

  # Validations
  validates :address, :zip_code, :location, :name, :nif, presence: true, length: { maximum: 120 }
  validates :status, presence: true, inclusion: { in: STATUSES.values }
  # validates :activity_type, presence: true, inclusion: { in: ACTIVITY_TYPES.values }

  # Instance Methods
  def to_s
    name
  end

  def full_address
    "#{address} #{zip_code} #{location}"
  end

  private

  # Callbacks
  def init
    self.status = STATUSES.fetch(:active)
  end

  def create_store_admin
    CompanyUser.create(company: self, user: Current.user, role: CompanyUser::ROLES.fetch(:admin))
  end
end
