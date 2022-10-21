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

  def load_all_games
    file = 'games.json'
    games = []
    if File.exist?(file) && File.read(file) != ''
      games = JSON.parse(File.read(file)).map do |game|
        Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
      end
    end
    games
  end

  def load_all_authors
    file = 'author.json'
    authors = []
    if File.exists?(file) && File.read(file) != ''
      authors = JSON.parse(File.read(file)).map do |auth|
        Author.new(auth['first_name'], auth['last_name'])
      end
    end
    authors
  end
end
