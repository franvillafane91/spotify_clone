module Artists
  class FollowersNotifier
    def self.execute(followers)
      followers = self.artist.listeners

      followers.each do |follower|
        puts "======= #{follower.email} NOTIFICADO ======="
      end
    end
  end
end
