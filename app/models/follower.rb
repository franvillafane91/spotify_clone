class Follower < ApplicationRecord
  belongs_to :artist
  belongs_to :listener


  scope :by_artist_id, ->(artist_id) { where(artist_id: artist_id) }
end
