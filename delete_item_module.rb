#  rubocop:disable all

require './music_album'
require './book'
require './game'
require 'date'

module ItemKiller
  def initialize
    @item_option = '0'
  end

  def items_to_delete
    puts "\n Which item do you want to delete from your catalog 🗑️ :"
    puts '1) Delete a book 📗'
    puts '2) Delete a Music Album 🎶'
    puts '3) Delete a Game 🎮'
    puts '4) Go back to the Catalog 🗂️'
    puts "\n"
  end

  def delete_selected_item
    case @item_option
    when '1'
      delete_book
    when '2'
      delete_music_album
    when '3'
      delete_game
    when '4'
      nil
    else
      "\nCould you please choose a valid number\n"
    end
  end

  def delete_item
    until %w[1 2 3 4].include?(@item_option)
      items_to_delete
      @item_option = gets.chomp
      delete_selected_item
    end
    @item_option = '0'
  end
end

def remove_by_id(id, list)
    new_list = list.reject! {|item| item.id == id}
    return new_list
end

def delete_music_album
    if @music_albums.empty?
        puts 'your music albums list is empty' 
    else
    list_music_albums
    print 'Select item you want to remove by [ID] => '
    id = gets.chomp
    @music_albums = remove_by_id(id, @music_albums) || []
    puts "\nYour Music album deleted successfuly."
    end
end


