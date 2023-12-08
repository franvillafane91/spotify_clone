class Listener < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers
  has_many :artists, through: :followers
  has_many :likes, dependent: :destroy
end
