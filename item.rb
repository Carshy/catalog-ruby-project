class Item
  attr_accessor :source, :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(_id, publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    time_now = (Time.now.year - @publish_date)
    if time_now > 10
      true
    else
      false
    end
    
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end

item = Item.new(2019, false)
puts(item.can_be_archived?)
