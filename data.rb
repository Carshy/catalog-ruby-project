require 'json'

module Data
  def load_all_albums
    file = 'music_album.json'
    albums = []
    if File.exist?(file) && File.read(file) != ''
      albums = JSON.parse(File.read(file)).map do |album|
        MusicAlbum.new(album['publish_date'], album['on_spotify'])
      end
    end
    albums
  end

  def load_all_genres
    file = 'genre.json'
    safe_genres = []
    if File.exist?(file) && File.read(file) != ''
      safe_genres = JSON.parse(File.read(file)).map do |genre|
        Genre.new(genre['publish_date'], genre['name'])
      end
    end
    safe_genres
  end
end
