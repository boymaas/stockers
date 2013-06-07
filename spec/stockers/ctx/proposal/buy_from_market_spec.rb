require 'stockers'

module Stockers::Ctx::Proposal

  describe BuyFromMarket do
    context "valid player_portfolio and market_share" do
      let(:updated_player_portfolio) { BuyFromMarket.call(portfolio, market_share, share_count) }

      it "adds portfolio_share to the portfolio" do
        
      end
    end
  end

end
