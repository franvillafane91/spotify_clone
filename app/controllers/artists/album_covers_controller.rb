module Artists
  class AlbumCoversController < ApplicationController

    def show
      pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
      save_path = Rails.root.join('public', 'pdfs', 'filename.pdf')

      File.open(save_path, 'wb') do |file|
        file << pdf
      end
    end
  end
end
