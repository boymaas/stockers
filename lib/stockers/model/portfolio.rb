module Stockers
  module Model
    class Portfolio 

      include DataMapper::Resource

      belongs_to :player
      has n, :portfolio_shares

      property :id,         Serial
      property :name,       String

    end
  end
end
