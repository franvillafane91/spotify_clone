module Listeners
  class ArtistsController < ApplicationController
    before_action :authenticate_listener!

    def show
      @artist = Artist.find(params[:id])

      @albums = @artist.albums.visible_for_public

      @artist.increment_visit_count
    end
  end
end

