class Album < ApplicationRecord
  belongs_to :artist

  has_many :songs, dependent: :destroy

  validates :title, presence: true

  scope :visible_for_public, -> { where(published: true) }
end
