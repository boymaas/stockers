module Stockers
  module Ctx
    module Portfolio
      class AddsMarketShare
        include Context

        attr_reader :portfolio, :market_share

        def initialize(portfolio, market_share)
          @portfolio = AveragedPortfolio.new(portfolio)
          @market_share = market_share
        end

        def call(share_count, price=nil)
          in_context do
            portfolio.add_market_share(share_count, price)
            portfolio.save
          end
        end
        
        def self.call(portfolio, market_share, share_count, price=nil)
          new(portfolio, market_share).call(share_count, price)
        end

        class AveragedPortfolio < DelegateClass(Model::Portfolio)
          include ContextAccessor

          def add_market_share count, price=nil
            price ||= context.market_share.price

            # find portfolio_share containing market_share
            # if not just create
            # if do, add and average price
            portfolio_share = portfolio_shares.first(:market_share => context.market_share)


            # when we have, average price out, and add count
            # else just create a portfolio share
            if portfolio_share
              portfolio_share.price = ( portfolio_share.total_value + 
                ( price * count ) ) / ( portfolio_share.count + count )
              portfolio_share.count += count
            else
              portfolio_shares.create \
                :market_share => context.market_share,
                :price => price,
                :count => count
            end
          end
        end
      end
    end
  end
end
