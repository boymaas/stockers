# NOTE: require rubygems and bundler setup
# so normal requires will work
require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'active_support'

require 'stockers/env'
require 'stockers/setup_database_connection'

# Require MODELS first
require 'stockers/model/player'
require 'stockers/model/player_portfolio'

# Require ROLES second
require 'stockers/roles/player_portfolio/market_buyer'

# Require CONTEXTS last
require 'stockers/ctx/proposal/buy_from_market'

module Stockers
  # Your code goes here...
end
