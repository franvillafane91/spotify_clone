module Listeners
  class LikesController < ApplicationController
    before_action :authenticate_listener!
    

    def create
      listener = current_listener
      album = Album.find(params[:album_id])
      current_listener.likes.create(album_id: params[:album_id])

      artist = album.artist

      redirect_to listeners_artist_path(artist), notice: '¡Like !'
    end
    
    def destroy
      like = current_listener.likes.find_by(album_id: params[:id])

      like.destroy

      redirect_back(fallback_location: root_path)
    end


  end
end
