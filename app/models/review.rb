class Review < ApplicationRecord
  belongs_to :user
  belongs_to :subject, inverse_of: :reviews, optional: true
  has_many :dones, foreign_key: "done_review_id", dependent: :destroy
  default_scope -> {order(deadline_at: :asc)}
  validates :user_id, presence:true
  validates :content, presence: true, length: {maximum: 50}
  validates :deadline_at, presence: true
end
