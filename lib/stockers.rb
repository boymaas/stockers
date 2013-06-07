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
require 'stockers/model/portfolio'
require 'stockers/model/account'
require 'stockers/model/transaction'
require 'stockers/model/market'
require 'stockers/model/market_share'
require 'stockers/model/market_trade'
require 'stockers/model/player'
require 'stockers/model/portfolio'
require 'stockers/model/portfolio_share'

# Require ROLES second
require 'stockers/roles/player_portfolio/market_buyer'

# Require CONTEXTS last
require 'stockers/ctx/proposal/buy_from_market'

# Setup database connection
Stockers.setup_database_connection

