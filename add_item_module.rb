require './music_album'
require './book'
require './game'
require 'date'

#  rubocop:disable all

# Create Module
module ItemIntializer
  def initialize
    @item_option = '0'
  end

  def items_option
    puts "\n Which item do you want to add to your catalog ➕ :"
    puts '1) Create a book 📗'
    puts '2) Create a Music Album 🎶'
    puts '3) Create a Game 🎮'
    puts '4) Go back to the Catalog 🗂️'
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
    when '4'
      nil
    else
      "\nCould you please choose a valid number\n"
    end
  end

  def create_item
    until %w[1 2 3 4].include?(@item_option)
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



  def book_album_info
    print 'Published date (yyyy-mm-dd): '
    date_answer = gets.chomp
    publish_date = validate_date(date_answer)

    print 'Is it good or bad? [good/bad]: '
    answer = gets.chomp.downcase
    cover_state = cover_state?(answer)

    print 'Who is the publisher ? '
    publisher_answer = gets.chomp.downcase
    publisher = publisher_answer

    [publish_date, publisher, cover_state]
  end

  def book_label
    list_label
    print "\n Select you book label by number: "
    label_index = gets.chomp.to_i
    @labels[label_index]
  end

  def create_book
    publish_date, publisher, cover_state = book_album_info
    book_album = Book.new( publisher, cover_state, publish_date)
    label = book_label
    label.add_item(book_album)
    @books.push(book_album)
    puts 'Book created successfully ✔️'
  end

  def cover_state?(answer)
    case answer
    when 'bad'
      false
    when 'good'
      true
    else
      print 'Could you please specify your answer by [good/bad]: '
      new_answer = gets.chomp
      cover_state?(new_answer)
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

def game_info
  print 'Last played at (yyyy-mm-dd): '
  date_answer = gets.chomp
  last_played_at = date_answer

  print 'Is it Multiplayer? [Y/N]: '
  answer = gets.chomp.downcase
  multiplayer = multiplayer?(answer)

  print 'Publish date (yyyy-mm-dd): '
  publisher_answer = gets.chomp
  publish_date = validate_date(date_answer)

  [last_played_at, publish_date, multiplayer]
end

def game_author
  list_author
  print "\n Select your author by number: "
  author_index = gets.chomp.to_i
  @authors[author_index]
end

def create_game
  publish_date, multiplayer, last_played_at = game_info
  game = Game.new( publish_date, multiplayer, last_played_at)
  author = game_author
  author.add_item(game)
  @games.push(game)
  puts 'Game created successfully ✔️'
end

def multiplayer?(answer)
  case answer
  when 'n'
    false
  when 'y'
    true
  else
    print 'Could you please specify your answer by [Y/N]: '
    new_answer = gets.chomp
    multiplayer?(new_answer)
  end
 end
