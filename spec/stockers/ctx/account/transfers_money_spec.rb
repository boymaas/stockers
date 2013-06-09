require 'stockers'

require 'support/blueprints'

module Stockers
  module Ctx
    module Account

      describe TransfersMoney do
        context "enough funds in src account" do
          let(:src_account) { Model::Account.make! :balance => 10 }
          let(:dst_account) { Model::Account.make! :balance => 0}

          let!(:updated_player) { TransfersMoney.call(src_account, dst_account, 10) }

          specify  { src_account.balance.should == 0.0 }
          specify  { dst_account.balance.should == 10.0 }

          specify  { src_account.should be_an(Model::Account) }
          specify  { dst_account.should be_an(Model::Account) }
        end
        context "insufficient funds in src account" do
          let(:src_account) { Model::Account.make! :balance => 9.9 }
          let(:dst_account) { Model::Account.make! :balance => 0}


          it "raises InsufficientFunds error" do
            lambda do
              TransfersMoney.call(src_account, dst_account, 10) 
            end.should raise_error(TransfersMoney::SourceAccount::InsufficientFunds)
          end
        end
      end
    end
  end
end
