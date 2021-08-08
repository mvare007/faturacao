# == Schema Information
#
# Table name: taxes
#
#  id         :bigint           not null, primary key
#  name       :string
#  percentage :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_taxes_on_name  (name) UNIQUE
#
class Tax < ApplicationRecord
  # Associations
  has_many :products, dependent: :restrict_with_error

  # Delegates

  # Callbacks

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true

  # Instance Methods
  def to_s
    "#{name} - #{percentage}"
  end
end
