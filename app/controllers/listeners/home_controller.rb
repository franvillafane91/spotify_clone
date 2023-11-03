module Listeners
  class HomeController < ApplicationController
    before_action :authenticate_listener!

    def index
    #   @artists = Artist.all
    #   if current_listener
    #     @followed_artists = current_listener.artists
    #   else
    #     @followed_artists = []
    #   end 
    # end 
      @artists = Artist.not_follow(current_listener)
      @followed_artists = current_listener.artists
    end
  end
end
