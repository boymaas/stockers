module Stockers
  module Roles
    module PlayerPortfolio
      class MarketBuyer < DelegateClass(PlayerPortfolio)
        def initialize(player_portfolio)
          super(player_portfolio)
        end
      end
    end
  end
end
