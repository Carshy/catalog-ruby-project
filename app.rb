require './Classes/genre'
require './Classes/music_album'
require './data'
require 'json'

class App
  attr_accessor :genre, :music_album

  def initialize
    @genres = load_all_genres
    @music_album = load_all_albums
  end

  include Data

  def list_genres
    new_genre =  Genre.new(1900, 'hip-hop')

    @genres.push(new_genre)
    if @genres.length.positive?
      @genres.each do |genre|
        puts " Date: #{genre.publish_date}, Name: #{genre.name}"
      end
    else
      puts 'No genre added'
    end

    safe_genres = []
    @genres.each do |genre|
      safe_genres.push({ publish_date: genre.publish_date, name: genre.name })
    end

    File.write('genre.json', safe_genres.to_json)
  end

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
    puts new_music_album.publish_date

    albums = []
    @music_album.each do |album|
      albums.push({publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    File.write('music_album.json', albums.to_json)
  end

  def list_music_albums
    if @music_album.length.positive?
      @music_album.each do |album|
        puts "Date: #{album.publish_date}, on_spotify: #{album.on_spotify}"
      end
    else
      puts 'No music albums'
    end
  end
end
