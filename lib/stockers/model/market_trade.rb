module Stockers
  module Model
    class MarketTrade 

      include DataMapper::Resource

      belongs_to :market
      belongs_to :market_share

      property :id                , Serial
      property :seller_id         , Integer, :key => true, :required => true
      property :buyer_id          , Integer, :key => true, :required => true
      property :value_purchased   , Float, :required => true
      property :value_sold        , Float, :required => true
      property :count             , Integer, :required => true
      property :transaction_costs , Float, :required => true, :default => 0.0
      property :created_at        , DateTime, :required => true, :default => lambda { Time.now }
    end
  end
end
