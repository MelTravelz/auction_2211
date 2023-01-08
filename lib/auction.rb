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
  #=> ["Chalkware Piggy Bank", "Bamboo Picture Frame"]

  def unpopular_items
    @items.map do |item|
      item if item.bids == {}
    end.compact
  end

  def potential_revenue
    p_rev = 0

    items.each do |item|
      item.bids.each do |person, bid_amount|
        if item.bids.count > 1
          p_rev =+ item.bids.values.max
        else
          p_rev += bid_amount
        end
      end
    end
    p_rev
    # item.current_high_bid if item.bids.count > 1 #=> 22
  end

end