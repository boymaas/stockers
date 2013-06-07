# NOTE: require rubygems and bundler setup
# first to be able to run Bundler.require to load
# all dependencies
require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'active_support'

# Require MODELS first
require 'stockers/model/player_portfolio'

# Require ROLES second
require 'stockers/roles/player_portfolio/market_buyer'

# Require CONTEXTS last
require 'stockers/ctx/proposal/buy_from_market'

module Stockers
  # Your code goes here...
end
