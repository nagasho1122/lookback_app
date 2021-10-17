class Subject < ApplicationRecord
  belongs_to :lookback
  has_many :lookback_details, dependent: :destroy, inverse_of: :subject
  accepts_nested_attributes_for :lookback_details
  has_many :reviews, dependent: :destroy, inverse_of: :subject
  accepts_nested_attributes_for :reviews
  validates :subject, presence: true
end
