#  rubocop:disable all

require './add_item_module'
require './list_items_module'


class App
  include ItemIntializer
  include ListItems

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
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
        break
      end

      handle_option(option)
    end

    puts "\n Thank you for using this app 🙏🏻"
  end

  def handle_option(option)
    case option
    when '1'
      create_item
    when '2'
      list_items
    else
      puts 'That is not a valid option ❌'
    end
  end
end


app = App.new

app.run