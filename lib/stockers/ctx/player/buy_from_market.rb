
module Stockers
  module Ctx
    module Player
      class BuyFromMarket
        include Context

        attr_reader :player, :src_account, :dst_account, :market_share

        def initialize(player, market_share)
          @player = MarketBuyer.new(player)
          @market_share = market_share
          @src_account  = player.account
          # NOTE: Because of the fact activerecord loads
          # account here by reference it is not
          # reflected in the specs. This SUCKS!!
          @dst_account  = market_share.market.account
        end

        def call(share_count)
          in_context do
            player.buys_market_share(share_count)
            player.save
          end
        end
        
        def self.call(player, market_share, share_count)
          new(player, market_share).call(share_count)
        end

        class MarketBuyer < DelegateClass(Model::Player)
          include ContextAccessor

          # Player buys shares from market an puts
          # it into his portfolio
          def buys_market_share count
            price          = context.market_share.calculate_price(count)

            Account::TransfersMoney.call(context.src_account, context.dst_account, price)
            Portfolio::AddsMarketShare.call(context.player.portfolio, context.market_share, count)

          end
        end
      end
    end
  end
end
