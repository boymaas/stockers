module Stockers
  module Ctx
    module Player
      class BuyProposal
        include Context

        class NotEnoughSharesInProposal < RuntimeError; end

        attr_reader :buyer, :seller, :proposal

        def initialize(buyer, proposal)
          @buyer = ProposalBuyer.new(buyer)
          @seller = proposal.player
          @proposal = proposal
        end

        def call(share_count)
          in_context do
            buyer.buy_proposal(share_count)

            # save all domain objects
            buyer.save ; seller.save
            proposal.save unless proposal.destroyed?
          end
        end
        
        def self.call(buyer, proposal, share_count)
          new(buyer, proposal).call(share_count)
        end

        class ProposalBuyer < DelegateClass(Model::Player)

          include ContextAccessor

          # creates a proposal to sell on the market
          def buy_proposal count
            if count > context.proposal.count
              raise NotEnoughSharesInProposal
            end

            # check count range
            src_account = context.buyer.account
            dst_account = context.seller.account
            price_per_share = context.proposal.price

            # Pay for proposal
            Account::TransfersMoney.call \
              src_account,
              dst_account,
              price_per_share*count

            # Add shares to players portfolio
            Portfolio::AddsMarketShare.call \
              context.buyer.portfolio,
              context.proposal.market_share,
              count, price_per_share

            # remove count from from proposal, and portfolio_share
            # and delete completely when count = 0
            deduct_and_destroy_when_empty context.proposal, count 
            deduct_and_destroy_when_empty context.proposal.portfolio_share, count 
          end

          def deduct_and_destroy_when_empty entity, count
            entity.count -= count
            if entity.count == 0
              entity.destroy!
            end
          end
        end
      end
    end
  end
end
