class Review < ApplicationRecord
  belongs_to :user
  belongs_to :subject, inverse_of: :reviews
  default_scope -> {order(deadline_at: :asc)}
  validates :user_id, presence:true
  validates :content, presence: true, length: {maximum: 50}
  validates :deadline_at, presence: true
end
