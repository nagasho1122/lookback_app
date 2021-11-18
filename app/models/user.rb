class User < ApplicationRecord
  has_many :lookbacks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :dones, dependent: :destroy
  has_many :done_review, through: :dones
  validates :name, presence: true
  validates :email, presence: true
  
  class << self
    def find_or_create_from_auth_hash(auth_hash)
      user_params = user_params_from_auth_hash(auth_hash)
      find_or_create_by(email: user_params[:email], name: user_params[:name], image: user_params[:image]) do |user|
        user.update(user_params)
      end
    end
    
    private

    def user_params_from_auth_hash(auth_hash)
      {
        name: auth_hash.info.name,
        email: auth_hash.info.email,
        image: auth_hash.info.image,
      }
    end
  end
  
end
