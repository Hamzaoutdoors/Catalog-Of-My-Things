# MusicAlbum Class

require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :name, :genre, :publish_date
  attr_reader :on_spotify

  DEFAULT_BOOL = false

  def initialize(name, publish_date, on_spotify = DEFAULT_BOOL)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  def to_s
    "Album\'s name : \"#{@name}\" ~ Published on : #{@publish_date} / #{@on_spotify ? 'Available on spotify' : 'Not available on spotify'}"
  end

  def can_be_archived?
    super && @on_spotify
  end

  private :can_be_archived?
end
