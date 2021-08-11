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
#  store_id      :bigint           not null
#  store_user_id :bigint           not null
#
# Indexes
#
#  index_invoices_on_operation_id        (operation_id)
#  index_invoices_on_store_id       (store_id)
#  index_invoices_on_store_user_id  (store_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (operation_id => operations.id)
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (store_user_id => store_users.id)
#
class Invoice < ApplicationRecord
  # Associations
  belongs_to :operation
  belongs_to :store
  belongs_to :store_user
  has_many :invoice_products, dependent: :destroy

  # Delegates
  delegate :name, :nif, :address, :zip_code, :location, :license_number, to: :store, prefix: true, allow_nil: true
  with_options allow_nil: true do
    delegate :total, :total_tax, to: :operation
    delegate :user, to: :store_user
  end

  # Callbacks

  # Validations
  validates :customer_nif, presence: true
  validates :customer_name, length: { maximum: 120 }

  # Instance Methods

  # private

  # Instance Private Methods
end
