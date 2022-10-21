require './Classes/genre'
require './Classes/music_album'
require './data'
require './Classes/game'
require './Classes/author'
require './Classes/book'
require './Classes/label'
require './Classes/container'
require './Classes/label_container'
require 'json'

class App
  attr_accessor :genres, :music_album

  def initialize
    @genres = load_all_genres
    @music_album = load_all_albums
    @games = load_all_games
    @authors = load_all_authors
    @books = read_books
    all_books = File.read('./Classes/json_files/book.json')
    File.write('./Classes/json_files/book.json', []) if all_books.empty?
    @label_container = LableContainer.new
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

  def add_game
    print 'Is it a multiplayer game? [Y/N]: '
    multiplayer_answer = gets.chomp.upcase
    multiplayer = multiplayer_answer == 'Y'
    print 'Last played at: '
    last_played_at = gets.chomp.to_i
    print 'Published at: '
    publish_date = gets.chomp.to_i
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game

    new_games = []
    @games.each do |g|
      new_games.push({ multiplayer: g.multiplayer, last_played_at: g.last_played_at, publish_date: g.publish_date })
    end
    File.write('games.json', new_games.to_json)

    puts "Author's first name: "
    first_name = gets.chomp
    puts "Author's last name: "
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    author.add_item(game)
    @authors << author

    new_author = []
    @authors.each do |auth|
      new_author.push({ first_name: auth.first_name, last_name: auth.last_name })
    end
    File.write('authors.json', new_author.to_json)
    puts 'Game is added successfully'
  end

  def list_games
    if @games.empty?
      puts 'Games not found'
    else
      @games.each do |game|
        puts "
        Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}
        Last played at: #{game.last_played_at}
        Published on: #{game.publish_date}"
      end
    end
  end

  def list_authors
    puts 'Currently there is no author' if @authors.empty?
    @authors.each do |auth|
      puts "First Name: #{auth.first_name}, Last Name: #{auth.last_name}"
    end
  end

  def list_of_labels
    @label_container.list_of_labels
  end

  def add_book
    puts 'Please fill the following to add a book'
    puts 'Enter Publisher: '
    publisher = gets.chomp

    puts 'Enter cover state Good(Y) OR Bad(N): '
    status = gets.chomp
    cover_state = cover_status(status)
    puts 'Enter Publish Year: '
    year = gets.chomp
    book = Book.new(publisher, cover_state, year)
    write_books(book)
    @books << book
    @label_container.add_label
    puts '*** You Successfully Added a Book ***'
  end

  def list_of_books
    if @books.empty?
      puts 'There are no available books!'
    else
      puts 'List of Books: '
      @books.each_with_index do |bk, indx|
        puts "#{indx + 1}) Publisher: #{bk.publisher} Publish Date: #{bk.publish_date} Cover State: #{bk.cover_state}"
      end
    end
  end

  def cover_status(status)
    case status
    when 'y'
      'good'
    when 'n'
      'bad'
    else
      puts 'Invalid Choice'
      puts 'Cover state Good (Y) OR Bad (N):'
      status = gets.chomp
      cover_status(status)
    end
  end
end
