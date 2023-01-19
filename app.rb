require_relative 'utilities/book_label_utilities'
require_relative 'utilities/game_author_utilities'
require_relative 'utilities/musicalbum_genre_utilities'

class App
  include BookLabelUtilities
  include GameAuthorUtilities
  include MusicAlbumGenreUtilities

  def initialize
    @books = load_books
    @labels = load_labels
    @games = load_games
    @authors = load_authors
    @genre = load_genre || []
    @music_album = load_music_album || []
  end

  def show_options
    puts "Please choose an option by entering a number:
    1- List all books
    2- List all labels\n    3- List all music albums
    4- List all games\n    5- List all authors\n    6- List all genres
    7- Add a book\n    8- Add a music album
    9- Add a game\n    10- Exit"
  end

  def list_items(number)
    case number
    when 1
      list_books
    when 2
      list_labels
    when 3
      list_music_album
    when 4
      list_games
    when 5
      list_authors
    when 6
      list_genre
    end
  end

  def add_items(number)
    case number
    when 7
      create_book
    when 8
      create_music_album
    when 9
      create_game
    end
  end

  def pick_action(number)
    if number <= 6
      list_items(number)
    else
      add_items(number)
    end
  end

  def save_data
    save_games
    save_authors
    preserve_music_album
    preserve_genre
    save_books
    save_labels
  end

  def run
    puts 'Welcome to your catalog of things!'
    exit = false
    until exit
      show_options
      number = gets.to_i
      if number < 10
        pick_action(number)
      elsif number == 10
        exit = true
        save_data
        puts 'Thanks for using our catalog of things app, see you soon!'
      else
        puts "Error friend, wrong input. Sorry I don't make the rules ¯\\(ツ)/¯"
      end
    end
  end
end
