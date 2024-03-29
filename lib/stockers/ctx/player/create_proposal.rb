module Stockers
  module Ctx
    module Player
      class CreateProposal
        include Context

        class NotEnoughSharesInPortfolio < RuntimeError; end

        attr_reader :player, :portfolio_share

        def initialize(player, portfolio_share)
          @player = ProposalCreator.new(player)
          @portfolio_share = portfolio_share
        end

        def call(share_count, price)
          in_context do
            player.propose_to_sell(share_count, price)
            player.save
          end
        end
        
        def self.call(player, portfolio_share, share_count, price)
          new(player, portfolio_share).call(share_count, price)
        end

        class ProposalCreator < DelegateClass(Model::Player)

          include ContextAccessor

          # creates a proposal to sell on the market
          def propose_to_sell count, price
            if context.portfolio_share.shares_available_for_proposals < count
              raise NotEnoughSharesInPortfolio
            end

            context.portfolio_share.proposals.create \
              :price => price,
              :count => count

          end
        end
      end
    end
  end
end
