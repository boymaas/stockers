require 'stockers'

require 'support/blueprints'

module Stockers
  module Ctx
    module Proposal

      describe BuyFromMarket do
        context "valid player_portfolio and market_share" do
          let(:player) { Model::Player.make! }
          let(:market) { Model::Market.make!}
          let(:market_share) { market.market_shares.first }
          let(:share_count) { 10 }

          let(:updated_player) { BuyFromMarket.call(player, market_share, share_count) }

          let(:updated_portfolio) { updated_player.portfolio  }

          specify  { subject.portfolio_shares.count.should == 1 }
        end
      end

    end
  end
end
