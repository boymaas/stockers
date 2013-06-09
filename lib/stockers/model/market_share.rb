module Stockers
  module Model
    class MarketShare 
      include DataMapper::Resource

      belongs_to :market

      property :id           , Serial
      property :name         , String
      property :company_name , String
      property :summary      , String
      property :price        , Float  , :default => 0.0
      property :infolink     , String

      def calculate_price count
        price * count
      end
    end
  end
end
