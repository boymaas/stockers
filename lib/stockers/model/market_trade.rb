module Stockers
  module Model
    class MarketTrade 

      include DataMapper::Resource

      belongs_to :market
      belongs_to :market_share

      property :id                , Serial
      property :seller_id         , Integer
      property :buyer_id          , Integer
      property :value_purchased   , Float
      property :value_sold        , Float
      property :count             , Integer
      property :transaction_costs , Float
      property :created_at        , DateTime
    end
  end
end
