require 'spec_helper'


module Stockers
  module Ctx
    module Portfolio

      describe AddsMarketShare do
        let(:player) { Model::Player.make! }
        let(:portfolio) { player.portfolio }
        let(:market) { Model::Market.make! }
        let(:market_share) {  Model::MarketShare.make! :price => 30.0, :market => market }

        context "with market_share not in portfolio" do
          before { described_class.call( portfolio, market_share, 10 ) }
            
          subject { portfolio.portfolio_shares.first(:market_share => market_share) }

          specify { subject.count.should == 10 }
          specify { subject.price.should == 30 }
          
        end

        context "with market_share in portfolio" do
          let!(:portfolio_share) { portfolio.portfolio_shares.create \
                                                      :market_share => market_share, 
                                                      :price => 10.0,
                                                      :count => 10 }

          before { described_class.call( portfolio, market_share, 10 ) }
            
          subject { portfolio.portfolio_shares.first(:market_share => market_share) }

          specify { subject.count.should == 20 }
          specify { subject.price.should == 20.0 }
        end
      end

    end
  end
end

