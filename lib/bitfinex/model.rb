require 'virtus'

module Bitfinex
  class PriceLevel
    include Virtus.value_object

    values do
      attribute :amount, Float
      attribute :price, Float
      attribute :timestamp, Integer
    end
  end

  class OrderBook
    include Virtus.model

    attribute :bids, Array[PriceLevel]
    attribute :asks, Array[PriceLevel]
  end

  class Ticker
    include Virtus.value_object

    values do
      attribute :mid, Float
      attribute :bid, Float
      attribute :ask, Float
      attribute :last_price, Float
      attribute :low, Float
      attribute :high, Float
      attribute :volume, Float
      attribute :timestamp, Integer
    end
  end

  class Trade
    include Virtus.model

    attribute :price, Float
    attribute :amount, Float
    attribute :exchange, String
    attribute :timestamp, Integer
    attribute :type, String
    attribute :fee_currency, String
    attribute :fee_amount, Float
    attribute :tid, Integer
    attribute :order_id, Integer

    def id
      self.tid
    end
  end

  class Order
    include Virtus.model

    attribute :order_id, Integer
    attribute :symbol, String
    attribute :exchange, String
    attribute :price, Float
    attribute :avg_execution_price, Float
    attribute :side, String
    attribute :type, String
    attribute :timestamp, Integer
    attribute :is_live, Boolean
    attribute :is_cancelled, Boolean
    attribute :is_hidden, Boolean
    attribute :was_forced, Boolean
    attribute :executed_amount, Float
    attribute :remaining_amount, Float
    attribute :original_amount, Float
  end
end
