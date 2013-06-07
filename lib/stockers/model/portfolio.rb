module Stockers
  module Model
    class Portfolio < ActiveRecord::Base
      belongs_to :player
      has_many :portfolio_shares
    end
  end
end
