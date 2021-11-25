#  rubocop:disable all
require './music_album'
require './book'

module ListItems
  def initialize
    @list_item_option = '0'
  end

  def list_items_option
    puts "\n Which item do you wish to list :"
    puts '1) List all books '
    puts '2) List all music albums'
    puts '3) List all games'
    puts "\n"
  end

  def list_selected_item
    case @list_item_option
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_games
    else
      "\nCould you please choose a valid number\n"
    end
  end

  def list_items
    until %w[1 2 3].include?(@list_item_option)
      list_items_option
      print 'Enter your option number here --> '
      @list_item_option = gets.chomp
      list_selected_item
    end
    @list_item_option = '0'
  end

  def list_music_albums
    puts "\n List of your Music Albums : "
    puts "\n ~ Your music albums list is empty ~" if @music_albums.empty?
    @music_albums.each { |music_album| puts music_album }
  end

  def list_genres
    puts "\n List of genres : "
    @genres.each_with_index { |genre, index| puts "#{index}) Genre ~ #{genre.name}" }
  end

  def list_books

    puts "\n List of your Books : "
    puts "\n Your books list is empty." if @books.empty?
    @books.each { |book| puts book}
  end

  def list_label
    puts "\n List of labels: "
    @labels.each{ |label| puts "Title: #{label.title} Color: #{label.color}"}
  end

  def list_games
    puts 'game'
  end
end
