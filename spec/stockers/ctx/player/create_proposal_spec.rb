require 'spec_helper'

module Stockers
  module Ctx
    module Player

      describe CreateProposal do
          let(:player) { Model::Player.make! }
          let(:market) { Model::Market.make! }
          let(:market_share) { market.market_shares.first }

          # NOTE: lazy evalutated
          let(:portfolio_share) { player.portfolio.portfolio_shares.first }
          let(:proposal) { portfolio_share.proposals.first }

          before do
            player.account.increase_balance(100_000)
            BuyFromMarket.call(player, market_share, 10)
          end

          context "valid " do
            before do
              CreateProposal.call(player, portfolio_share, 10, 20.0)
            end

            it { proposal.price.should == 20.0 }
            it { proposal.count.should == 10.0 }
          end
      end

    end
  end
end
