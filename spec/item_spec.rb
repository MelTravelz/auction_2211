require 'rspec'
require './lib/item'
require './lib/attendee'

RSpec.describe Item do 
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
  let(:item4) { Item.new('2 Days Dogsitting') }
  let(:item5) { Item.new('Forever Stamps') }

  let(:attendee1) { Attendee.new(name: 'Megan', budget: '$50') }
  let(:attendee2) { Attendee.new(name: 'Bob', budget: '$75') }

  describe "IT1 - #initialize" do
    it "exists" do
      expect(item1).to be_instance_of(Item)
      expect(item2).to be_instance_of(Item)
    end

    it "has attributes" do
      expect(item1.name).to eq("Chalkware Piggy Bank")
      expect(item1.bids).to eq({})
    end
  end

  describe "IT2 - tests concerning bids" do
    it "can #add_bid" do 
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end

    it "can return the #current_high_bid" do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.current_high_bid).to eq(22)
    end
  end
end