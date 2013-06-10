require 'spec_helper'

module Stockers
  module Ctx
    module Player

      describe CancelProposal do
          let(:player) { Model::Player.make! }
          let(:market) { Model::Market.make! }
          let(:market_share) { market.market_shares.first }

          # NOTE: lazy evalutated
          let(:portfolio_share) { player.portfolio.portfolio_shares.first }
          let(:proposal) { portfolio_share.proposals.first }

          before do
            player.account.increase_balance(100_000)
            BuyFromMarket.call(player, market_share, 10)
            CreateProposal.call(player, portfolio_share, 10, 20.0)
          end

          it "cancels the proposal" do
            CancelProposal.call(player, proposal)
            portfolio_share.proposals.should be_empty
          end
      end

    end
  end
end
