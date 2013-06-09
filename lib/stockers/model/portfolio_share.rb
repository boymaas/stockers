module Stockers
  module Model
    class PortfolioShare 

      include DataMapper::Resource

      belongs_to :portfolio
      belongs_to :market
      belongs_to :market_share

      property :id    , Serial
      property :price , Float
      property :count , Integer
    end
  end
end
