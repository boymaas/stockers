require 'spec_helper'

module Stockers
  module Ctx
    module Player

      describe BuyFromMarket do
        context "valid player_portfolio and market_share" do
          let(:player) { Model::Player.make }
          let(:market) { Model::Market.make :market_shares => [ market_share ] }
          let(:market_share) { Model::MarketShare.make :price => 1.0 }
          let(:share_count) { 10 }

          let(:updated_portfolio) { player.portfolio  }

          before do
            # set correct balance to be able to pay for 
            # our shares
            player.account.increase_balance(10.0)
            player.save
            market.save

            # execute context, updating all objects
            BuyFromMarket.call(player, market_share, share_count) 
          end

          it { player.account.balance.should == 0.0 }
          it { market.account.balance.should == 10.0 }

          xit { updated_portfolio.portfolio_shares.count.should == 1 }
        end
      end

    end
  end
end
