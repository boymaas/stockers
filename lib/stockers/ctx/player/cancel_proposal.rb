module Stockers
  module Ctx
    module Player
      class CancelProposal
        include Context

        attr_reader :player, :proposal

        def initialize(player, proposal)
          @player = ProposalCancellor.new(player)
          @proposal = proposal
        end

        def call
          in_context do
            player.cancels_proposal
            # NOTE: since we only removed, we only have
            # to flag the player to reload, proposals
            proposal.portfolio_share.proposals.reload
          end
        end
        
        def self.call(player, proposal)
          new(player, proposal).call
        end

        class ProposalCancellor < DelegateClass(Model::Player)

          include ContextAccessor

          # creates a proposal to sell on the market
          def cancels_proposal
            context.proposal.destroy!
          end
        end
      end
    end
  end
end
