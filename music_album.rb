# MusicAlbum Class
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :genre, :publish_date

  DEFAULT_BOOL = false

  def initialize(publish_date, on_spotify = DEFAULT_BOOL)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  private :can_be_archived?
end
