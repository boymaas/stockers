require 'spec_helper'

module Stockers
  module Ctx
    module Player

      describe BuyProposal do
          let(:seller) { Model::Player.make! }
          let(:buyer) { Model::Player.make! }
          let(:market) { Model::Market.make! }
          let(:market_share) { market.market_shares.first }

          # NOTE: lazy evalutated
          let(:portfolio_share) { seller.portfolio.portfolio_shares.first }
          let(:proposal) { portfolio_share.proposals.first }

          before do
            seller.account.increase_balance(100_000)
            buyer.account.increase_balance(100_000)
            BuyFromMarket.call(seller, market_share, 10)
            CreateProposal.call(seller, portfolio_share, 10, 20.0)
          end

          let(:buyer_portfolio_share) { buyer.portfolio.portfolio_shares.first }
          let(:seller_portfolio_share) { seller.portfolio.portfolio_shares.first }

          context "buy exactly the amount of shares in the proposal" do
            before do
              BuyProposal.call(buyer, proposal, 10)
              # NOTE: need to reload here to get accurate account information
              #       this is because account is references in the context
              #       indirectly, through the proposal.player
              seller.reload
            end

            it { market.account.balance.should == 500 }               #       0 + 500

            it { seller.account.balance.should == 99_700 }            # 100_000 - 500 + 200
            it { buyer.account.balance.should == 99_800 }             # 100_000 - 200

            it { buyer_portfolio_share.count.should == 10 }
            it { buyer_portfolio_share.price.should == 20 }

            # Proposal should be deleted, in this case all portfolio
            # shares should be deleted
            it { seller.portfolio.portfolio_shares.should == [] }
          end
          context "buy a part of the shares in the proposal" do
            before do
              BuyProposal.call(buyer, proposal, 5)
              # NOTE: need to reload here to get accurate account information
              #       this is because account is references in the context
              #       indirectly, through the proposal.player
              seller.reload
            end

            it { market.account.balance.should == 500 }               #       0 + 500

            it { seller.account.balance.should == 99_600 }            # 100_000 - 500 + 100
            it { buyer.account.balance.should == 99_900 }             # 100_000 - 100

            it { buyer_portfolio_share.count.should == 5 }
            it { buyer_portfolio_share.price.should == 20 }

            # Now on the sellers account portfolio_share should exists
            # with 5 shares left. And the proposal should exist with
            # 5 shares left. Both with original price
            it { seller_portfolio_share.count.should == 5 }
            it { seller_portfolio_share.price.should == 50.0 }
            it { seller_portfolio_share.proposals.first.price.should == 20.0 }
            it { seller_portfolio_share.proposals.first.count.should == 5 }
          end
          context "buy more than the shares in the proposal" do
            it "raises the appropiate error" do
              lambda do
                BuyProposal.call(buyer, proposal, 15)
              end.should raise_error(BuyProposal::NotEnoughSharesInProposal)
            end
          end
      end

    end
  end
end
