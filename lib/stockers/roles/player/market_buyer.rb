module Stockers
  module Roles
    module Player
      class MarketBuyer < DelegateClass(Model::Player)
        def initialize(player)
          super(player)
        end

        # Player buys shares from market an puts
        # it into his portfolio
        def buys_market_share market_share, count
          market_account = market_share.market.account
          price          = market_share.calculate_price(count)

          account.transfer(market_account, price)

          portfolio.add_market_share(market_share, count)
        end
      end
    end
  end
end
