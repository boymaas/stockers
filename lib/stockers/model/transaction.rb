module Stockers
  module Model
    class Transaction 

      include DataMapper::Resource

      belongs_to :account

      property      :id              , Serial
      property      :account_balance , Float, :required => true
      property      :amount          , Float, :required => true
    end
  end
end
