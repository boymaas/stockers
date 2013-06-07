require 'stockers'

require 'support/blueprints'

module Stockers
  module Model
    describe Player do
      it "works"  do
        p = described_class.make!(:email => "example@example.com")          
        p.pry
      end
    end
  end
end
