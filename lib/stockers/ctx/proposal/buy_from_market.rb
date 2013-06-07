require 'stockers/roles/player_portfolio/market_buyer'

module Stockers
  module Ctx
    module Proposal
      class BuyFromMarket
        def initialize(player_portfolio)
          @player_portfolio = Roles::PlayerPortfolio::MarketBuyer.new(player_portfolio)
        end

        def call(market_share, share_count)
          @player_portfolio
        end
        
        def self.call(player_portfolio, market_share, share_count)
          new(player_portfolio).call(market_share, share_count)
        end
      end
    end
  end
end
