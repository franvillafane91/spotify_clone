module AlbumCovers
  class PdfGenerator
    def self.execute(album)
      pdf = WickedPdf.new.pdf_from_string(
        ActionController::Base.new.render_to_string(
          template: 'shared/album_covers/show',
          layout: 'pdf',
          locals: {album: album})
      )

      return pdf
    end
  end
end
