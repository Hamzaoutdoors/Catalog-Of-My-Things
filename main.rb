#  rubocop:disable all

require './addItem_module'

class App
  include ItemIntializer

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @choice_list = {
      '1' => 'Create a book 📗',
      '2' => 'Create a Music Album 🎶',
      '3' => 'Create a Game 🎮',
      '4' => 'List all books.',
      '5' => 'List all music albums.',
      '6' => 'List of games.',
      '7' => 'List all genres.',
      '8' => 'List all labels.',
      '9' => 'List all authors.',
      '10' => 'Exit'
    }  
  end

  def run
    puts "Welcome to the Catalog of your Things 🗂️ \n"

    loop do
      puts "\nPlease choose your option by entering a number 😊 :"
      puts "\n"
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      print "\nYour option ==> "
      option = gets.chomp
      if option == '10'
        break
      end

      handle_option(option)
    end

    puts "\n Thank you for using this app 🙏🏻"
  end

  def handle_option(option)
    case option
    when '1'
      puts 'Book'
    when '2'
      create_music_album
    else
      puts 'That is not a valid option ❌'
    end
  end
end


app = App.new

app.run