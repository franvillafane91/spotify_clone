module Artists
  class ArtistCoversController < ApplicationController
    def show
      album = Album.find(params[:id])
      
      file_name = AlbumCovers::NamePdf.execute

      pdf = AlbumCovers::PdfGenerator.execute(album)

      send_data pdf, filename: file_name, type: 'application/pdf', disposition: 'attachment'
    end
  end
end
