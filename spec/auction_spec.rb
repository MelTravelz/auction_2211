require 'rspec'
require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  let(:auction) { Auction.new }

  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
  let(:item4) { Item.new('2 Days Dogsitting') }
  let(:item5) { Item.new('Forever Stamps') }

  let(:attendee1) { Attendee.new(name: 'Megan', budget: '$50') }
  let(:attendee2) { Attendee.new(name: 'Bob', budget: '$75') }
  let(:attendee3) { Attendee.new(name: 'Mike', budget: '$100') }
  
  describe "IT1 - #initialize" do
    it "exists" do
      expect(auction).to be_instance_of(Auction)
    end

    it "has attributes" do
      expect(auction.items).to eq([])
    end
  end

  describe "IT1 - tests concerning items" do
    it "can #add_item to items array" do
      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.items).to eq([item1, item2])
    end

    it "can return #item_names" do
      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe "IT2 - tests concerning bids & revenue" do
    it "can return #unpopular_items" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
  
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)

      expect(auction.unpopular_items).to eq([item2, item3, item5])

      item3.add_bid(attendee2, 15)

      expect(auction.unpopular_items).to eq([item2, item5])
    end

    it "can return #potential_revenue" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
  
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.potential_revenue).to eq(87)
    end
  end

  describe "IT3 - tests concerning bidders" do
    it "can return array of #bidders" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
  
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.bidders).to eq([attendee2, attendee1, attendee3])
    end

    it "can return a hash of bidders with #bidder_info" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
  
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expected = {
        attendee1 => { :budget => 50, :items => [item1] },
        attendee2 => { :budget => 75, :items => [item1, item3] },
        attendee3 => { :budget => 100, :items => [item4] }
        }

      expect(auction.bidder_info).to eq(expected)
    end
  end

end
