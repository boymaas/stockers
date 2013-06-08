require 'stockers/roles/player/market_buyer'

module Stockers
  module Ctx
    module Proposal
      class BuyFromMarket
        def initialize(player)
          @player = Roles::Player::MarketBuyer.new(player)
        end

        def call(market_share, share_count)
          @player
        end
        
        def self.call(player, market_share, share_count)
          new(player).call(market_share, share_count)
        end
      end
    end
  end
end
