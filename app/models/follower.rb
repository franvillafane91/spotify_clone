class Follower < ApplicationRecord
  belongs_to :artist
  belongs_to :listener

enum status: { following: 0, unfollowed: 1 }
  scope :by_artist_id, ->(artist_id) { where(artist_id: artist_id) }
end
