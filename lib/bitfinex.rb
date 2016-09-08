require 'bitfinex/net'
require 'bitfinex/model'
require 'bitfinex/orders'

module Bitfinex
  class << self
    # API Key
    attr_accessor :key
    # Bitfinex secret
    attr_accessor :secret
    # Currency
    attr_accessor :symbol
  end

  self.symbol = :btcusd

  def self.order_book(options = {})
    return Bitfinex::OrderBook.new(JSON.parse(Bitfinex::Net.get("/v1/book/#{symbol}", options).to_str))
  end

  def self.ticker(options = {})
    return Bitfinex::Ticker.new(JSON.parse(Bitfinex::Net.get("/v1/pubticker/#{symbol}", options).to_str))
  end

  def self.my_trades(options = {})
    self.sanity_check!

    default = { symbol: symbol }
    return JSON.parse(Bitfinex::Net.post("/v1/mytrades", default.merge(options)).to_str).map do |trade_attr|
      Bitfinex::Trade.new(trade_attr)
    end
  end

  def self.balances(options = {})
    self.sanity_check!

    return JSON.parse(Bitfinex::Net.post("/v1/balances", options))
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
