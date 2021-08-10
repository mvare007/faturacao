# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_product_categories_on_name  (name) UNIQUE
#
class ProductCategory < ApplicationRecord
  # Associations
  has_many :products, dependent: :nullify

  # Delegates

  # Callbacks

  # Scopes

  # Validations
  validates :name, presence: true, length: { maximum: 120 }, uniqueness: true
  validates :description, length: { maximum: 400 }

  # Instance Methods
  def to_s
    name
  end
end
