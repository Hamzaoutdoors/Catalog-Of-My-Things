# MusicAlbum Class

require_relative 'item'
require_relative 'genre'


class MusicAlbum < Item
  attr_accessor :genre, :publish_date, :name

  DEFAULT_BOOL = false

  def initialize(name, publish_date, on_spotify = DEFAULT_BOOL)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  def to_s
    "Album\'s name : \" #{@name} \", Published on :#{@publish_date}"
  end

  def can_be_archived?
    super && @on_spotify
  end
 
  private :can_be_archived?
end

=begin
music = MusicAlbum.new('hamza', '2020-10-10', true)
genre = Genre.new('Hiphup')
genre.add_item(music)
puts music
=end
