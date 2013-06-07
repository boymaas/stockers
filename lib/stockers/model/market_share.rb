module Stockers
  module Model
    class MarketShare < ActiveRecord::Base
      belongs_to :market
    end
  end
end
