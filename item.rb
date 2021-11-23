require 'date'

# Create class ITEM
class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)  
  end

  private

  def can_be_archived?
    archived_date = Date.iso8601(@publish_date).next_year(10)
    Date.today > archived_date
  end
end
