# == Schema Information
#
# Table name: operations
#
#  id            :bigint           not null, primary key
#  total         :decimal(, )
#  total_tax     :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  store_id      :bigint           not null
#  store_user_id :bigint           not null
#
# Indexes
#
#  index_operations_on_store_id       (store_id)
#  index_operations_on_store_user_id  (store_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (store_user_id => store_users.id)
#
class Operation < ApplicationRecord
  audited

  # Associations
  belongs_to :store
  belongs_to :store_user
  has_many :operation_products, dependent: :destroy
  has_many :invoices, dependent: :restrict_with_error

  # Delegates
  delegate :name, :nif, :address, :zip_code, :location, :license_number, to: :store, prefix: true, allow_nil: true
  delegate :user, to: :store_user, allow_nil: true

  # Nested Attributes
  accepts_nested_attributes_for :operation_products, allow_destroy: true

  # Callbacks

  # Validations
  validates :total, :total_tax, presence: true

  # Instance Methods
end
