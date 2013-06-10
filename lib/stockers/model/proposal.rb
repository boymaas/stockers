module Stockers
  module Model
    class Proposal 

      include DataMapper::Resource

      # belongs_to :market_share
      belongs_to :portfolio_share
      has 1, :portfolio, :through => :portfolio_share
      has 1, :market_share, :through => :portfolio_share

      def player
        portfolio.player
      end

      property :id                 , Serial
      property :count              , Integer
      property :price              , Float
      property :buy                , Boolean
      property :created_at         , DateTime,
               :required => true, :default => lambda { |_,_| DateTime.now }

      def calculate_price count
        price * count
      end

    end
  end
end
