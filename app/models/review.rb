class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lookback_detail, inverse_of: :reviews
  default_scope -> {order(deadline_at: :desc)}
  validates :lookback_detail_id, presence: true
  validates :user_id, presence:true
  validates :content, presence: true, length: {maximum: 50}
  validates :deadline_at, presence: true
end
