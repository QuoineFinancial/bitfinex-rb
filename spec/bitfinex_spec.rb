require 'spec_helper'

describe Bitfinex do
  describe 'symbol' do
    it 'defaults with btcusd' do
      expect(Bitfinex.symbol).to eq(:btcusd)
    end
  end
  describe 'order_book', vcr: { cassette_name: 'bitfinex/order_book' } do
    let(:order_book) { Bitfinex.order_book }

    it "returns OrderBook" do
      expect(order_book).to be_kind_of(Bitfinex::OrderBook)
    end
    it "have asks" do
      expect(order_book).to respond_to("asks")
    end
    it "have bids" do
      expect(order_book).to respond_to("bids")
    end
    it "asks is an array" do
      expect(order_book.asks).to be_kind_of(Array)
    end
    it "bids is an array" do
      expect(order_book.bids).to be_kind_of(Array)
    end

    context "with params", vcr: { cassette_name: 'bitfinex/order_book_limit' } do
      let(:order_book) { Bitfinex.order_book(:limit_bids => 20, :limit_asks => 20, :group => 1) }
      it "returns as query" do
        expect(order_book["bids"].size).to eq(20)
        expect(order_book["asks"].size).to eq(20)
      end

    end
  end

  describe 'ticker', vcr: { cassette_name: 'bitfinex/ticker' } do
    let(:ticker) { Bitfinex.ticker }

    it "returns Hash" do
      expect(ticker).to be_kind_of(Bitfinex::Ticker)
    end
  end

  describe 'my_trades' do
    context "is properly configurated", vcr: { cassette_name: 'bitfinex/my_trades_configured' } do
      before do
        Bitfinex.setup do |config|
          config.key = "BMfSp3wAdmWqaZ5cdG5JHecXcsxL8reBYHq4oZrR99b"
          config.secret = "P9cWLeSUQwiGdUP9pDkKXhhgE3xx74Bt4rQwDs3Ybe5"
        end
      end
      let(:trades) { Bitfinex.my_trades }

      it "returns Array" do
        expect(trades).to be_kind_of(Array)
      end
    end

    context "has not been configurated yet", vcr: { cassette_name: 'bitfinex/my_trades_without_config' }do
      before do
        Bitfinex.setup do |config|
          config.key = nil
          config.secret = nil
        end
      end
      let(:trades) { Bitfinex.my_trades }

      it "throws error" do
        expect{ trades }.to raise_error(Bitfinex::MissingConfigExeception)
      end
    end
  end
end
