# == Schema Information
#
# Table name: discounts
#
#  id          :bigint           not null, primary key
#  description :string
#  expiry_date :date
#  name        :string
#  percentage  :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_discounts_on_name  (name) UNIQUE
#
class Discount < ApplicationRecord
  # Associations
  has_many :sales_products, dependent: :nullify

  # Delegates

  # Callbacks

  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 120 }
  validates :percentage, presence: true, numericality: { less_than: 100 }
  validates :description, length: { maximum: 400 }

  # Instance Methods
end
