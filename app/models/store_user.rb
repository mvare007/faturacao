# == Schema Information
#
# Table name: store_users
#
#  id               :bigint           not null, primary key
#  status           :string
#  store_admin      :boolean
#  store_supervisor :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  store_id         :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_store_users_on_store_id  (store_id)
#  index_store_users_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
class StoreUser < ApplicationRecord
  audited

  # Associations
  belongs_to :user
  belongs_to :store

  # Constants
  STATUSES = { active: 'active', inactive: 'inactive' }.freeze

  # Delegates
  with_options prefix: true, allow_nil: true do
    delegate :full_name, :admin, :status, to: :user
    delegate :name, to: :store
  end

  # Callbacks
  after_initialize :init, if: :new_record?

  # Validations
  validates :status, presence: true, inclusion: { in: STATUSES.values }

  # Instance Methods
  def to_s
    "#{user_full_name} - #{store_name}"
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
