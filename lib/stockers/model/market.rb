module Stockers
  module Model
    class Market 
      include DataMapper::Resource

      belongs_to :account
      has n, :market_shares

      property :id          , Serial
      property :name        , String
      property :description , String
      property :label       , String, :required => true, :unique => true

      property :open        , Time
      property :close       , Time
      property :active      , Boolean
      property :disabled    , Boolean
      property :is_currency , Boolean

    end
  end
end
