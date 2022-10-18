def main
    puts 'Welcome to catalog of things: To use the app choose from the following'
    loop do
      puts 'Please choose an option by entering a number:'
      puts '1 - List of Books
       2 - List all labels (e.g. Gift, 'New')
       3 - Add a book
       4 - List all music albums
       5 - List all genres (e.g 'Comedy', 'Thriller')
       6 - Add a music album
       7 - List of games
       8 - List all authors (e.g. 'Stephen King')
       9 - Add a game
       10 - Exit'
      choice = gets.chomp.to_i
      if choice == 10
        puts 'Thank you for using our App'
        break
      end
      start_app(choice)
    end
  end
  
  main