class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items.push(item)
  end
  #=> [item1, item2]

  def item_names
    items.map do |item|
      item.name
    end
  end
end