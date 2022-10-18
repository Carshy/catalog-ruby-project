def main
    puts 'Welcome to catalog of things: To use the app choose from the following'
    loop do
      puts 'Please choose an option by entering a number:'
      puts '1 - List
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
    end
  end
  
  main