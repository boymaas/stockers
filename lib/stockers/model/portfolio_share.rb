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

      def shares_available_for_proposals
        count - shares_in_proposals
      end

      def shares_in_proposals
        proposals.map(&:count).inject(0, :+)
      end
    end
  end
end
