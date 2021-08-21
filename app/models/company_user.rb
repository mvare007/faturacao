# == Schema Information
#
# Table name: company_users
#
#  id               :bigint           not null, primary key
#  status           :string
#  company_admin      :boolean
#  company_supervisor :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_id         :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_company_users_on_company_id  (company_id)
#  index_company_users_on_user_id   (user_id)
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
  with_options prefix: true, allow_nil: true do
    delegate :full_name, :admin, :status, to: :user
    delegate :name, to: :company
  end

  # Constants
  STATUSES = { active: 'active', inactive: 'inactive' }.freeze

  # Scopes
  scope :for_company, ->(company) { where(company: company) }

  # Callbacks
  after_initialize :init, if: :new_record?

  # Validations
  validates :status, presence: true, inclusion: { in: STATUSES.values }

  # Instance Methods
  def to_s
    "#{user_full_name} - #{company_name}"
  end

  # def inactive!
  #   self.status = STATUSES.fetch(:inactive)
  # end

  # def active!
  #   self.status = STATUSES.fetch(:active)
  # end

  private

  def init
    self.status = STATUSES.fetch(:active)
  end
end
