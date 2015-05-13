require 'active_support'
require 'active_support/core_ext'

require 'bitfinex/net'
require 'bitfinex/model'
require 'bitfinex/orders'

module Bitfinex
  # API Key
  mattr_accessor :key

  # Bitfinex secret
  mattr_accessor :secret

  # Currency
  mattr_accessor :symbol
  @@symbol = :btcusd

  def self.order_book(options = {})
    return Bitfinex::OrderBook.new(JSON.parse(Bitfinex::Net.get("/v1/book/#{symbol}", options).to_str))
  end

  def self.ticker(options = {})
    return Bitfinex::Ticker.new(JSON.parse(Bitfinex::Net.get("/v1/pubticker/#{symbol}", options).to_str))
  end

  def self.my_trades(options = {})
    self.sanity_check!

    return JSON.parse(Bitfinex::Net.post("/v1/mytrades", options.merge(symbol: symbol)).to_str).map do |trade_attr| 
      Bitfinex::Trade.new(trade_attr)
    end
  end

  def self.setup
    yield self
  end

  def self.configured?
    self.key && self.secret
  end

  def self.sanity_check!
    unless configured?
      raise MissingConfigExeception.new("Bitfinex Gem not properly configured")
    end
  end

  class MissingConfigExeception < RuntimeError; end
end
