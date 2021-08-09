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
  belongs_to :store
  has_many :sales_products, dependent: :nullify

  # Constants
  STATUSES = { active: 'active', inactive: 'inactive' }.freeze

  # Delegates

  # Callbacks
  after_initialize :init, if: :new_record?

  # Validations
  # TODO: add date validation for start and end dates
  # start_date - can only be in the future or present
  # end_date - can only be in the future and after start_date
  # validate :start_date_validation, :end_date_validation
  validates :name, presence: true, uniqueness: true, length: { maximum: 120 }
  validates :percentage, presence: true, numericality: { less_than: 100 }
  validates :start_date, presence: true
  validates :description, length: { maximum: 400 }

  # Instance Methods
  def to_s
    "#{name} - #{percentage}"
  end

  private

  def init
    # TODO: Create Service to check everyday which discounts should be activated based on the current date
    if Time.zone.today >= start_date
      self.status = STATUSES.fetch(:active)
    else
      self.status = STATUSES.fetch(:inactive)
    end
  end

  def start_date_validation
    errors.add(:start_date, :invalid) unless start_date > Time.zone.today
  end

  def end_date_validation
    errors.add(:end_date, :invalid) unless end_date > start_date
  end
end
