# == Schema Information
#
# Table name: product_statuses
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_product_statuses_on_name  (name) UNIQUE
#
class ProductStatus < ApplicationRecord
  # Associations
  has_many :products, dependent: :restrict_with_error

  # Constants
  # STATUSES = {
  #   in_stock: 'in_stock',
  #   out_of_stock: 'out_of_stock',
  #   unavailable: 'unavailable',
  #   discontinued: 'discontinued'
  # }.freeze

  # Delegates
  validates :name, presence: true, length: { maximum: 120 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 120 }

  # Callbacks

  # Validations

  # Instance Methods
  def to_s
    name
  end
end
