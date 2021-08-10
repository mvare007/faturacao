# == Schema Information
#
# Table name: sale_products
#
#  id          :bigint           not null, primary key
#  quantity    :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  discount_id :bigint
#  product_id  :bigint           not null
#  sale_id     :bigint           not null
#
# Indexes
#
#  index_sale_products_on_discount_id  (discount_id)
#  index_sale_products_on_product_id   (product_id)
#  index_sale_products_on_sale_id      (sale_id)
#
# Foreign Keys
#
#  fk_rails_...  (discount_id => discounts.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (sale_id => sales.id)
#
class SaleProduct < ApplicationRecord
  audited

  # Associations
  belongs_to :sale
  belongs_to :product
  belongs_to :discount, optional: true
  has_many :invoice_products, dependent: :restrict_with_error

  # Delegates
  with_options prefix: true, allow_nil: true do
    delegate :name, :unit_price, :code, :description, to: :product
    delegate :name, :percentage, to: :discount
  end

  # Scopes
  scope :for_sale, ->(sale) { where(sale: sale) }

  # Callbacks

  # Validations
  validates :quantity, presence: true

  # Instance Methods
end
