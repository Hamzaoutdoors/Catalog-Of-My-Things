require 'date'

# Create class ITEM
class Item
  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :id

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    archived_date = Date.iso8601(@publish_date).next_year(10)
    Date.today > archived_date
  end

  private :can_be_archived?
end
