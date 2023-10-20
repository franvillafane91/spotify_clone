module AlbumsHelper
  def is_published?(published)
    published ? 'Publicado' : 'Oculto'
  end
end
