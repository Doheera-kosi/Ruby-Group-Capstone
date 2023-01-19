require_relative '../classes/game'
require_relative '../classes/author'
require 'json'

# GameAuthorUtilities module
module GameAuthorUtilities
  def create_author
    p "What is this game's creator's first name?"
    first_name = gets.chomp
    p "What is this game's creator's last name?"
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def create_game
    p 'When was this game published? (dd-mm-yyyy)'
    publish_date = gets.chomp
    p 'Is it a multiplayer game? (y/n)'
    multiplayer = gets.chomp == 'y'
    p 'When did you last play this game ? (dd-mm-yyyy)'
    last_played_at = gets.chomp

    author = create_author
    game = Game.new(publish_date, false, multiplayer, last_played_at)
    author.add_item(game)
    @games.push(game)
    @authors.push(author)
    puts "Game has been created successfully!\n"
  end

  def list_games
    if @games.empty?
      puts 'Games list is empty!'
    else
      @games.each_with_index do |game, index|
        puts "#{index}) ID: #{game.id}
        Last_palyed: #{game.last_played_at}
        Multiplayer: #{game.multiplayer}
        Author: #{game.author.first_name} #{game.author.last_name}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'Authors list is empty!'
    else
      @authors.each_with_index do |author, index|
        puts "#{index})ID: #{author.id}, First name: #{author.first_name}, Last name: #{author.last_name}\n"
      end
    end
  end

  def save_games
    return unless @games.any?

    games_data = JSON.generate(@games, { max_nesting: false })
    if File.exist?('./storage_files/games.json')
      File.write('./storage_files/games.json', games_data)
    else
      File.write('./storage_files/games.json', games_data, mode: 'w+')
    end
  end

  def save_authors
    return unless @authors.any?

    authors_data = JSON.generate(@authors, { max_nesting: false })
    if File.exist?('./storage_files/authors.json')
      File.write('./storage_files/authors.json', authors_data)
    else
      File.write('./storage_files/authors.json', authors_data, mode: 'w+')
    end
  end

  def load_games
    games = []
    if File.exist?('./storage_files/games.json')
      data = File.read('./storage_files/games.json')
      if data != ''
        JSON.parse(data).map do |game|
          new_game = Game.new(game['publish_date'], game['archived'], game['multiplayer'], game['last_played_at'],
                              game['id'])
          author = game['author']
          new_author = Author.new(author['first_name'], author['last_name'], author['id'])
          new_game.author = new_author
          games.push(new_game)
        end
      end
    end
    games
  end

  def load_authors
    authors = []
    if File.exist?('./storage_files/authors.json')
      data = File.read('./storage_files/authors.json')
      if data != ''
        JSON.parse(data).map do |author|
          new_author = Author.new(author['first_name'], author['last_name'], author['id'])
          authors.push(new_author)
        end
      end
    end
    authors
  end
end
