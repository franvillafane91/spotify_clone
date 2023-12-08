class Artist < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :albums
  has_many :followers
  has_many :listeners, through: :followers

  scope :not_follow, ->(listener) { where.not(id: listener.artist_ids) }

  def increment_visit_count
    update(visit_count: visit_count + 1)
  end
end



  

