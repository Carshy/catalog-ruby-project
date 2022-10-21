require './Classes/genre'
require './Classes/music_album'
require './data'
require 'json'

class App
  attr_accessor :genres, :music_album

  def initialize
    @genres = load_all_genres
    @music_album = load_all_albums
  end

  include Data

  def add_music_album
    puts 'publish_date?: '
    publish_date = gets.chomp.to_i

    puts 'on spotify?: [Y/N]'
    on_spotify = gets.chomp.capitalize
    case on_spotify
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Enter a valid response'
    end

    new_music_album = MusicAlbum.new(publish_date, on_spotify)
    @music_album.push(new_music_album)

    albums = []
    @music_album.each do |album|
      albums.push({ publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    File.write('music_album.json', albums.to_json)

    puts 'genre of music?'
    name = gets.chomp
    new_genre = Genre.new(publish_date, name)
    new_genre.add_item(new_music_album)
    @genres.push(new_genre)
    puts 'Music album created succesfully'

    safe_genres = []
    @genres.each do |genre|
      safe_genres.push({ publish_date: genre.publish_date, name: genre.name })
    end
    File.write('genre.json', safe_genres.to_json)
  end

  def list_music_albums
    if @music_album.length.positive?
      @music_album.each do |album|
        puts "publish_date: #{album.publish_date}, on_spotify: #{album.on_spotify}"
      end
    else
      puts 'No music albums'
    end
  end

  def list_genres
    if @genres.length.positive?
      @genres.each do |genre|
        puts "publish_date: #{genre.publish_date}, name: #{genre.name}"
      end
    else
      puts 'No music albums'
    end
  end
end
