# frozen_string_literal: true

require 'date'

# Create class ITEM
class Item
  attr_reader :id

  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..10_000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    archived_date = Date.iso8601(@publish_date).next_year(10)
    Date.today > archived_date
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

# item = Item.new('2011-11-24')
# puts item.can_be_archived?
