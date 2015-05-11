require 'active_support'
require 'active_support/core_ext'
require 'rest_client'
require 'hmac-sha2'

require 'bitfinex/net'

module Bitfinex
  # API Key
  mattr_accessor :key

  # Bitfinex secret
  mattr_accessor :secret

  # Currency
  mattr_accessor :symbol
  @@symbol = :btcusd

  def self.order_book
    return JSON.parse Bitfinex::Net.get("/book/#{symbol}").to_str
  end

  def self.setup
    yield self
  end

  def self.configured?
    self.key && self.secret && self.client_id
  end

  def self.sanity_check!
    unless configured?
      raise MissingConfigExeception.new("Bitfinex Gem not properly configured")
    end
  end
end
