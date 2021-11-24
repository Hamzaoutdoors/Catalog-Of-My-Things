require './music_album'
require 'date'

module ItemIntializer
  def initialize
    @item_option = '0'
  end

  def items_option
    puts "\n Which item do you want to add to your catalog :"
    puts '1) Create a book 📗'
    puts '2) Create a Music Album 🎶'
    puts '3) Create a Game 🎮'
    puts "\n"
  end

  def add_selected_item
    case @item_option
    when '1'
      create_book
    when '2'
      create_music_album
    when '3'
      create_game
    else
      "\nCould you please choose a valid number\n"
    end
  end

  def create_item
    until %w[1 2 3].include?(@item_option)
      items_option
      @item_option = gets.chomp
      add_selected_item
    end
    @item_option = '0'
  end

  # Music Album handlers
  def music_album_name
    print "Add your music album\'s name : "
    gets.chomp.to_s
  end

  def music_album_info
    name = music_album_name
    print 'Published date (yyyy-mm-dd): '
    date_answer = gets.chomp
    publish_date = validate_date(date_answer)

    print 'Is it on spotify? [Y/N]: '

    answer = gets.chomp.downcase
    on_spotify = on_spotify?(answer)

    [name, publish_date, on_spotify]
  end

  def on_spotify?(answer)
    case answer
    when 'y'
      true
    when 'n'
      false
    else
      print 'Could you please specify your answer by [y/n]: '
      second_answer = gets.chomp
      on_spotify?(second_answer)
    end
  end

  def validate?(date)
    Date.iso8601(date.to_s)
    true
  rescue ArgumentError
    false
  end

  def validate_date(date)
    if validate?(date)
      date
    else
      print 'Add a valid date format [yyyy-mm-dd] : '
      answer = gets.chomp
      validate_date(answer)
    end
  end

  # Add music album to genres
  def music_album_genre
    list_genres
    print "\n Select you Music Album\'s genre by number:  "
    genre_index = gets.chomp.to_i
    @genres[genre_index]
  end

  # Create MusicAlbum main method
  def create_music_album
    name, publish_date, on_spotify = music_album_info
    music_album = MusicAlbum.new(name, publish_date, on_spotify)
    genre = music_album_genre
    genre.add_item(music_album)
    @music_albums << music_album
    puts 'Music album created successfully ✔️'
  end
end
