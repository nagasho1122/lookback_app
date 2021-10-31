class Subject < ApplicationRecord
  belongs_to :lookback
  has_many :lookback_details, dependent: :destroy, inverse_of: :subject
  accepts_nested_attributes_for :lookback_details, :reject_if => :all_blank, allow_destroy: true
  has_many :reviews, dependent: :destroy, inverse_of: :subject
  accepts_nested_attributes_for :reviews, :reject_if => :all_blank, allow_destroy: true
  validates :subject, presence: true
end
