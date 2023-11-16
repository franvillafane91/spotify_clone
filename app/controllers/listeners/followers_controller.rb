module Listeners
  class FollowersController < ApplicationController
    before_action :authenticate_listener!

    def create
      current_listener.followers.create(artist_id: params[:artist_id])

      redirect_back(fallback_location: root_path)
    end

    def destroy
      follower = current_listener.followers.find_by(artist_id: params[:id])
      follower.destroy

      redirect_back(fallback_location: root_path)
    end
  end
end
