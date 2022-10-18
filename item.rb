class Item
  attr_accessor :source, :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    time_now = (Time.now.year - @publish_date)
    time_now > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
