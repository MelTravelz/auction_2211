require 'rspec'
require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  let(:auction) { Auction.new }

  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }

  let(:attendee) { Attendee.new(name: 'Megan', budget: '$50') }

  describe "#initialize" do
    it "exists" do
      expect(auction).to be_instance_of(Auction)
    end

    it "has attributes" do
      expect(auction.items).to eq([])
    end
  end

  describe "tests concerning #items" do
    it "can #add_item to items array" do
      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.items).to eq([item1, item2])
    end
  end

  # expect().to eq()
end
