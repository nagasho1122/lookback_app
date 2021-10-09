class LookbackDetail < ApplicationRecord
  belongs_to :lookback
  has_many :reviews, dependent: :destroy
  default_scope -> {order(created_at: :desc)}
  validates :lookback_id, presence: true
  validates :subject, presence: true, length: {maximum: 30}
  validates :number, presence: true
  validates :text, presence: true, length: {maximum: 500}
end
