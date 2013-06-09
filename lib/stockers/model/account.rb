module Stockers
  module Model
    class Account < ActiveRecord::Base
      has_many :transactions

      def decrease_balance amount
        self.balance -= amount

      end

      def increase_balance amount
        self.balance += amount
      end
    end
  end
end
