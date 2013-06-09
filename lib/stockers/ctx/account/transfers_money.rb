module Stockers
  module Ctx
    module Account
      class TransfersMoney
        include Context

        attr_reader :src_account, :dst_account

        def initialize(src_account, dst_account)
          @src_account = SourceAccount.new(src_account)
          @dst_account = DestinationAccount.new(dst_account)
        end

        def call(amount)
          in_context do
            src_account.transfer_out(amount) 
          end
        end

        def self.call(src_account, dst_account, amount)
          new(src_account, dst_account).call(amount)
        end

        class SourceAccount < DelegateClass(Model::Account)
          include ContextAccessor

          class InsufficientFunds < RuntimeError; end

          def transfer_out(amount)
            if balance < amount
              raise InsufficientFunds
            end
            decrease_balance(amount)
            context.dst_account.transfer_in(amount)
          end
        end

        class DestinationAccount < DelegateClass(Model::Account)
          def transfer_in(amount)
            increase_balance(amount)
          end
        end
      end
    end
  end
end
