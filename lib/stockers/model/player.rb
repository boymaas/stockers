module Stockers
  module Model
    class Player < ActiveRecord::Base
      belongs_to :account
      has_one :portfolio
    end
  end
end
