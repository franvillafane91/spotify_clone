module Listeners
  class AlbumCoversController < ApplicationController
    def show
      pdf = WickedPdf.new.pdf_from_string(
        render_to_string(layout: 'pdf', template: 'listeners/album_covers/show')
      )

      file_name = "album_cover_#{Time.now.to_i}.pdf"

      send_data pdf, filename: file_name, type: 'application/pdf', disposition: 'attachment'
    end
  end
end
