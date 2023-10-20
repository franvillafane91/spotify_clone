module Artists
  class AlbumsController < ApplicationController
    before_action :authenticate_artist!

    def index
      @albums = current_artist.albums
    end

    def show
      @album = current_artist.albums.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Album no existe!'
      redirect_to artists_albums_path
    end

    def destroy
      album = current_artist.albums.find(params[:id])

      if album.destroy
        flash[:alert] = 'Album borrado!'
      else
        flash[:alert] = 'Hubo un error!'
      end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Album no encontrado!'
    rescue ActiveRecord::InvalidForeignKey
      flash[:alert] = 'No es posible borrar el album'
    ensure
      redirect_to artists_albums_path
    end

    def create
      album = current_artist.albums.build(album_params)

      if album.save
        flash[:alert] = 'Album creado!'
        redirect_to artists_albums_path
      else
        flash[:alert] = 'Hubo un error!'
        redirect_to new_artists_album_path
      end
    end

    def new
      @album = current_artist.albums.build
    end

    def edit
      @album = current_artist.albums.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Album no encontrado!'
      redirect_to artists_albums_path
    end

    def update
      album = current_artist.albums.find(params[:id])

      if album.update(album_params)
        flash[:alert] = 'Album actualizado!'
        redirect_to artists_album_path(album)
      else
        flash[:alert] = 'Hubo un error!'
        redirect_to edit_artists_album_path(album)
      end
    end

    private

    def album_params
      params.require(:album).permit(:title, :published)
    end
  end
end
