module AlbumCovers
  class NamePdf
    def self.execute
      file_name = "album_cover_#{Time.now.to_i}.pdf"
      return file_name
    end
  end
end
