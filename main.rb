require './app'

def start_app(app, choice)
  case choice
  when 1
    app.list_of_book
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.list_music_albums
  when 5
    app.list_genres
  when 6
    app.add_music_album
  else
    puts 'Invalid choice'
  end
end

def main
  app = App.new
  puts 'Welcome to catalog of things: To use the app choose from the following'
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List of Books
       2 - List all labels
       3 - Add a book
       4 - List all music albums
       5 - List all genres
       6 - Add a music album
       7 - List of games
       8 - List all authors
       9 - Add a game
       10 - Exit'
    choice = gets.chomp.to_i
    if choice == 10
      puts 'Thank you for using our App'
      break

    end
    start_app(app, choice)
  end
end

main
