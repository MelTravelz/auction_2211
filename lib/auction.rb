class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items.push(item)
  end
  #returns=> [item1, item2]

  def item_names
    items.map do |item|
      item.name
    end
  end
  #returns=> ["Chalkware Piggy Bank", "Bamboo Picture Frame"]

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

  def bidders
    items.flat_map do |item|
      item.bids.keys
    end.uniq
  end
  #returns=> [attendee2, attendee1, attendee3]

  def bidder_info
    bidders_and_info = Hash.new 

    bidders.each do |person|
      bidders_and_info[person.name] = {:budget => person.budget}
    end

    # how to get the item into the value-hash that I've created?
    # items.each do |item|
    #   item.bids.each do |item_obj, bid_amount|
    #     if item_obj.name(bidders_by_name.keys) 
    #       #
    #     end
    #   end
    # end

    bidders_and_info
  end

end