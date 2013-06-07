require 'stockers'

module Stockers
  module Model
    describe Player do
      it "works"  do
        p = described_class.create!(:email => "example@example.com")          
      end
    end
  end
end
