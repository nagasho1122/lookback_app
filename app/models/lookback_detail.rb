class LookbackDetail < ApplicationRecord
  belongs_to :subject, inverse_of: :lookback_details
  default_scope -> {order(created_at: :desc)}
  validates :unit, presence: true, length: {maximum: 30}
  validates :number, presence: true
  validates :text, presence: true, length: {maximum: 500}
end
