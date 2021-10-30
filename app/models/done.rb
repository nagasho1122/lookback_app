class Done < ApplicationRecord
  belongs_to :user
  belongs_to :done_review, class_name: "Review"
  validates :user_id, presence: true
  validates :done_review_id, presence: true
end
