module Stockers
  module Model
    class Proposal 

      include DataMapper::Resource

      # belongs_to :market_share
      belongs_to :portfolio_share

      property :id                 , Serial
      property :count              , Integer
      property :price              , Float
      property :buy                , Boolean
      property :created_at         , DateTime,
               :required => true, :default => lambda { |_,_| Time.now }

    end
  end
end
