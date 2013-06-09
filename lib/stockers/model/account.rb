module Stockers
  module Model
    class Account 
      include DataMapper::Resource

      property :id      , Serial
      property :balance , Float

      has n, :transactions

      def decrease_balance amount
        self.balance -= amount

      end

      def increase_balance amount
        self.balance += amount
      end
    end
  end
end
