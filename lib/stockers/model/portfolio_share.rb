module Stockers
  module Model
    class PortfolioShare < ActiveRecord::Base
      belongs_to :portfolio
      belongs_to :market
      belongs_to :market_share
    end
  end
end
