class Done < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :user_id, presence: true
  validates :review_id, presence: true
end
