# == Schema Information
#
# Table name: product_statuses
#
#  id         :bigint           not null, primary key
#  key        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductStatus < ApplicationRecord
  # Associations
  has_many :products, dependent: :restrict_with_error

  # Constants
  STATUSES = {
    in_stock: 'in_stock',
    out_of_stock: 'out_of_stock',
    unavailable: 'unavailable',
    discontinued: 'discontinued'
  }.freeze

  # Delegates
  validates :key, :name, presence: true, length: { maximum: 120 }

  # Callbacks

  # Validations

  # Instance Methods
  def to_s
    name
  end
end
