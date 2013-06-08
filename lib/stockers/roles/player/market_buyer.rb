module Stockers
  module Roles
    module Player
      class MarketBuyer < DelegateClass(Model::Player)
        def initialize(player)
          super(player)
        end
      end
    end
  end
end
