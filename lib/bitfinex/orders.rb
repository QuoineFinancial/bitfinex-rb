module Bitfinex
  module Orders
    def self.active_orders
      Bitfinex.sanity_check!

      JSON.parse(Bitfinex::Net.post("/v1/orders").to_str).map do |order_attr|
        Bitfinex::Order.new(order_attr)
      end
    end

    def self.create(order_attr)
      Bitfinex.sanity_check!
      default = { symbol: Bitfinex.symbol }
      result = Bitfinex::Net.post("/v1/order/new", default.merge(order_attr)).to_str
      Bitfinex::Order.new(JSON.parse(result))
    end

    def self.get(options)
      Bitfinex.sanity_check!
      result = Bitfinex::Net.post("/v1/order/status", options).to_str
      Bitfinex::Order.new(JSON.parse(result))
    end
  end
end
