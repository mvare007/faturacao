# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  code                :string
#  name                :string
#  unit_price          :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :bigint
#  product_status_id   :bigint           not null
#  tax_id              :bigint           not null
#
# Indexes
#
#  index_products_on_product_category_id  (product_category_id)
#  index_products_on_product_status_id    (product_status_id)
#  index_products_on_tax_id               (tax_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_category_id => product_categories.id)
#  fk_rails_...  (product_status_id => product_statuses.id)
#  fk_rails_...  (tax_id => taxes.id)
#
class Product < ApplicationRecord
  # Associations
  belongs_to :product_status
  belongs_to :product_category, optional: true
  belongs_to :tax
  has_many :sale_products, dependent: :destroy
  has_many :store_products, dependent: :destroy

  # Delegates
  with_options prefix: true, allow_nil: true do
    delegate :name, to: :product_status
    delegate :name, to: :product_category
    delegate :name, :value, to: :tax
  end

  # Callbacks

  # Validations
  validates :unit_price, presence: true
  validates :code, :name, presence: true, length: { maximum: 120 }
  validates :description, length: { maximum: 400 }

  # Instance Methods
end
