class Lookback < ApplicationRecord
  belongs_to :user
  has_many :lookback_details, dependent: :destroy, inverse_of: :lookback
  accepts_nested_attributes_for :lookback_details
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :university, presence: true, length: {maximum: 30}
  validates :faculty, presence: true, length: {maximum: 30}
  validates :department, presence: true, length: {maximum: 30}
  validates :year, presence: true
  validates :all_text, presence: true, length: {maximum: 500}
end
