# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  description :text
#  key         :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ProductCategory < ApplicationRecord
  # Associations
  has_many :products, dependent: :nullify

  # Delegates

  # Callbacks

  # Validations
  validates :key, :name, presence: true, length: { maximum: 120 }
  validates :description, length: { maximum: 400 }

  # Instance Methods
  def to_s
    name
  end
end
