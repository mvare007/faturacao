# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  admin      :boolean
#  email      :string
#  first_name :string
#  last_name  :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  # Association
  has_many :store_users, dependent: :destroy

  # Constants
  STATUSES = { active: 'active', inactive: 'inactive' }.freeze

  # Delegates

  # Callbacks
  after_initialize :init, if: :new_record?

  # Validations
  validates :first_name, :last_name, presence: true, length: { maximum: 120 }
  validates :status, presence: true, inclusion: { in: STATUSES.values }

  # Instance Methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    full_name
  end

  def inactive!
    self.status = STATUSES.fetch(:inactive)
  end

  def active!
    self.status = STATUSES.fetch(:active)
  end

  private

  def init
    self.status = STATUSES.fetch(:active)
  end
end
