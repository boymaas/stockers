module Stockers
  module Model
    class Market < ActiveRecord::Base
      belongs_to :account
      has_many :market_shares
    end
  end
end
