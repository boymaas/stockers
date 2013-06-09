module Stockers
  module Model
    class Transaction 

      include DataMapper::Resource

      belongs_to :account

      property      :id              , Serial
      property      :account_balance , Float
      property      :amount          , Float
    end
  end
end
