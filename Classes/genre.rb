require './item'

class Genre < Item
  attr_reader :items
  attr_accessor :name

  def initialize(publish_date, name = 'Unknown')
    super(publish_date)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
