class Artist < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :albums
  has_many :followers
  has_many :listeners, through: :followers

  scope :not_follow, ->(listener) { where.not(id: listener.artist_ids) }
end
