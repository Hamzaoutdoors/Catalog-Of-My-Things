#  rubocop:disable all
require_relative 'genre'
require './label'
require './author'
require './add_item_module'
require './delete_item_module'
require './list_items_module'
require './music_album_data'
require './book_album_data'
require './game_data'
require 'json'

class App
  include ItemIntializer
  include ItemKiller
  include ListItems
  include MusicAlbumStorage
  include BookStorage
  include GameStorage

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = [Genre.new('Blues'), Genre.new('Classical Music'), Genre.new('Hip hop'), Genre.new('Rap'), Genre.new('Pop'), Genre.new('House')]
    @labels = [Label.new('Love at the end of the day.', 'Blue'),Label.new('May I love you?', 'Red'),Label.new('The love of my lives.', 'Grey')]
    @authors = [Author.new('Kang', 'Adventure'), Author.new('Luis', 'Action'), Author.new('Melissa', 'Horror'), Author.new('Mo', 'Sport')]
    @choice_list = {
      '1' => 'Create an Item',
      '2' => 'Delete an Item',
      '3' => 'List all items.',
      '4' => 'List all genres.',
      '5' => 'List all labels.',
      '6' => 'List all authors.',
      '7' => 'Exit'
    }  
  end

  def run
    parse_music_albums
    parse_book
    parse_game
    puts "Welcome to the Catalog of your Things 🗂️ \n"

    loop do
      puts "\nPlease choose your option by entering a number 😊 :"
      puts "\n"
      catalog_list
      print "\nYour option ==> "
      option = gets.chomp
      if option == '7'
        exit
        break
      end

      handle_option(option)
    end
  end

  def catalog_list
    @choice_list.each do |key, value|
      puts "#{key} - #{value}"
    end
  end

  def handle_option(option)
    case option
    when '1'
      create_item
    when '2'
      delete_item
    when '3'
      list_items
    when '4'
      list_genres
    when '5'
      list_label
    when '6'
      list_authors
    else
      puts 'That is not a valid option ❌'
    end
  end

  def exit
    save_music_albums
    save_book
    save_game
    puts "\n Your data is preserved in our DB"
    puts " Thank you for using this app 🙏🏻"
  end
end


app = App.new
app.run