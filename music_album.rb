# MusicAlbum Class
# rubocop:disable Layout/LineLength

require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :name, :genre, :publish_date, :id
  attr_reader :on_spotify

  DEFAULT_BOOL = false

  def initialize(name, publish_date, on_spotify = DEFAULT_BOOL)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  def to_s
    "/ID/: #{self.id} - Album\'s name : \"#{@name}\" ~ Published on : #{@publish_date} / #{@on_spotify ? 'Available on spotify' : 'Not available on spotify'}"
  end

  def can_be_archived?
    super && @on_spotify
  end

  private :can_be_archived?
end

# rubocop:enable Layout/LineLength
