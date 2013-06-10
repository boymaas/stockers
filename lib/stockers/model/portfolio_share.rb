module Stockers
  module Model
    class PortfolioShare 

      include DataMapper::Resource

      belongs_to :portfolio
      belongs_to :market_share
      has n, :proposals

      property :id    , Serial
      property :price , Float
      property :count , Integer

      def total_value
        count * price
      end
    end
  end
end
