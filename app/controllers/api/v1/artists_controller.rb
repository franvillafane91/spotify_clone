module Api
  module V1
    class ArtistsController < ApplicationController
      def index
        artists = Artist.select(:id, :email)
        render json: { data: artists }
      end
    end
  end
end