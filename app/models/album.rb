class Album < ApplicationRecord
  belongs_to :artist

  has_many :songs, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true

  scope :visible_for_public, -> { where(published: true) }

  after_save :notify_listeners

  private

  def notify_listeners
    if (saved_change_to_published? && published == true)
      followers = self.artist.listeners

      followers.each do |follower|
        puts "======= #{follower.email} NOTIFICA ======="
      end
    end
  end
end
