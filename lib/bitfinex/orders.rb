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

      Bitfinex::Order.new(JSON.parse(Bitfinex::Net.post("/v1/order/new", order_attr).to_str))
    end
  end
end
