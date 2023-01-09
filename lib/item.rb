require './spec/auction_spec'

class Item
    attr_reader :name,
                :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid_amount)
    bids[attendee] = bid_amount
  end
  #returns=> {attendee2 => 20, attendee1 => 22}

  def current_high_bid
    bids.values.max
  end

end