class Follower < ApplicationRecord
  belongs_to :artist
  belongs_to :listener
end
