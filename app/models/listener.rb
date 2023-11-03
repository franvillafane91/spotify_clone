class Listener < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers
  has_many :artists, through: :followers
end
