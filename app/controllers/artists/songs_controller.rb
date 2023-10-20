module Artists
  class SongsController < ApplicationController
    before_action :authenticate_artist!
    
    def new
      @album = current_artist.albums.find(params[:album_id])
      @song = @album.songs.build
    end

    def create
      album = current_artist.albums.find(params[:album_id])
      song = album.songs.build(song_params)

      if song.save
        flash[:notice] = 'Canción creada exitosamente.'
        redirect_to artists_album_path(album)
      else
        flash[:alert] = 'Hubo un error al crear la canción.'
        redirect_to new_artists_album_song_path(album)
      end
    end

    def destroy
      album = current_artist.albums.find(params[:album_id])
      song = album.songs.find(params[:id])

      if song.destroy
        flash[:alert] = 'cancion borrada!'
        redirect_to artists_album_path(album)
      else
        flash[:alert] = 'Hubo un error!'
        redirect_to artists_album_path(album)
      end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'cancion no encontrada!'
      redirect_to artists_albums_path
    end
 
    def edit
      @album = current_artist.albums.find(params[:album_id])
      @song = @album.songs.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'cancion no encontrado!'
      redirect_to artists_album_path(@album)
    end

    def update
      album = current_artist.albums.find(params[:album_id])
      song = album.songs.find(params[:id])

      if song.update(song_params)
        flash[:notice] = 'Canción actualizada exitosamente.'
        redirect_to artists_album_path(album)
      else
        flash[:alert] = 'Hubo un error al actualizar la canción.'
        redirect_to new_artists_album_song_path(album)
      end
    end

    private

    def song_params
      params.require(:song).permit(:title, :duration)
    end
  end
end
