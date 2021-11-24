require '../item'

# Create label class
class Label
  attr_accessor :color, :title
  attr_reader :items

  def initialize(title, color)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
