module Stockers
  module Model
    class MarketShare < ActiveRecord::Base
      belongs_to :market

      def calculate_price count
        price * count
      end
    end
  end
end
