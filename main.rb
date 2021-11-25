#  rubocop:disable all
require_relative 'genre'
require_relative 'music_album'
require './add_item_module'
require './list_items_module'
require 'json'

class App
  include ItemIntializer
  include ListItems

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = [Genre.new('Blues'), Genre.new('Classical Music'), Genre.new('Hip hop'), Genre.new('Rap'), Genre.new('Pop'), Genre.new('House')]
    @labels = []
    @authors = []
    @choice_list = {
      '1' => 'Create an Item',
      '2' => 'List all items.',
      '3' => 'List all genres.',
      '4' => 'List all labels.',
      '5' => 'List all authors.',
      '6' => 'Exit'
    }  
  end

  def run
    parse_music_albums
    puts "Welcome to the Catalog of your Things 🗂️ \n"

    loop do
      puts "\nPlease choose your option by entering a number 😊 :"
      puts "\n"
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      print "\nYour option ==> "
      option = gets.chomp
      if option == '6'
        exit
        break
      end

      handle_option(option)
    end
  end

  def handle_option(option)
    case option
    when '1'
      create_item
    when '2'
      list_items
    when '3'
      list_genres
    else
      puts 'That is not a valid option ❌'
    end
  end

  # Preserve Music album data

  def save_music_albums
    @json_music_albums = []
    @music_albums.each do |music_album|
      @json_music_albums.push({'name' => music_album.name, 'publish_date' => music_album.publish_date, 'on_spotify' => music_album.on_spotify})
    end
    File.write('music_album.json', JSON.pretty_generate(@json_music_albums))
  end

  def parse_music_albums
    File.open('music_album.json', 'w') { |f| f.write JSON.pretty_generate([])} unless File.exist?('music_album.json')
    JSON.parse(File.read('music_album.json')).map do |music_album|
       @music_albums << MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify'])
    end
  end

  def exit
    save_music_albums
    puts "\n Your data is preserved in our DB"
    puts " Thank you for using this app 🙏🏻"
  end
end


app = App.new
app.run