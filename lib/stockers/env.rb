module Stockers
  def self.env
    ENV['STOCKERS_ENV'] || 'test'
  end
end
