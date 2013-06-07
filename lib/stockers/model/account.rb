module Stockers
  module Model
    class Account < ActiveRecord::Base
      has_many :transactions

    end
  end
end
