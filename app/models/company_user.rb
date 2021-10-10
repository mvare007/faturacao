# == Schema Information
#
# Table name: company_users
#
#  id         :bigint           not null, primary key
#  role       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_company_users_on_company_id  (company_id)
#  index_company_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
class CompanyUser < ApplicationRecord
  audited

  # Associations
  belongs_to :user
  belongs_to :company

  # Delegates
  delegate :name, to: :company, prefix: true, allow_nil: true
  delegate :full_name, :admin, :status, to: :user, allow_nil: true

  # Constants
  STATUSES = { active: 'active', inactive: 'inactive' }.freeze
  ROLES = { admin: 'admin', supervisor: 'supervisor' }.freeze

  # Scopes
  scope :for_company, ->(company) { where(company: company) }

  # Callbacks
  after_initialize :init, if: :new_record?

  # Validations
  validates :status, presence: true, inclusion: { in: STATUSES.values }
  validates :role, inclusion: { in: ROLES.values }, allow_blank: true

  # Instance Methods
  def to_s
    "#{user_full_name} - #{company_name}"
  end

  def role_name
    I18n.t("activerecord.attributes.company_user.roles.#{role}")
  end

  def status_name
    I18n.t("activerecord.attributes.company_user.statuses.#{status}")
  end

  private

  def init
    self.status = STATUSES.fetch(:active)
  end
end
