require 'spec_helper'

describe Bitfinex do
  describe 'order_book', vcr: { cassette_name: 'bitfinex/order_book' } do
    let(:order_book) { Bitfinex.order_book }

    it "returns Hash" do
      expect(order_book).to be_kind_of(Hash)
    end
    it "have asks" do
      expect(order_book).to have_key("asks")
    end
    it "have bids" do
      expect(order_book).to have_key("bids")
    end
    it "asks is an array" do
      expect(order_book["asks"]).to be_kind_of(Array)
    end
    it "bids is an array" do
      expect(order_book["bids"]).to be_kind_of(Array)
    end
  end

end
