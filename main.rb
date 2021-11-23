

#  rubocop:disable all

# Create class main

class Main

  def run
    response = nil
    puts 'Welcome to Catalog of my things'

    while response != 10
      puts 'please choose an option by entering a number :'
      puts '1 - Add book.'
      puts '2 - Add music album.'
      puts '3 - Add game.'
      puts '4 - List all books.'
      puts '5 - List all music albums.'
      puts '6 - List of games.'
      puts '7 - List all genres.'
      puts '8 - List all labels.'
      puts '9 - List all authors.'
      puts '10 - Exit.'

      response = gets.chomp

      puts "\n"
      case response
      when '1'
        puts 'Book'
      end
    end
  end
end

main = Main.new

main.say_hey
