# NOTE: require rubygems and bundler setup
# so normal requires will work
require 'rubygems'
require 'bundler/setup'

require 'data_mapper'

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

# Require CONTEXTS last
require 'stockers/context_accessor'
require 'stockers/context'
require 'delegate'

require 'stockers/ctx/account/transfers_money'
require 'stockers/ctx/player/buy_from_market'

# Setup database connection
Stockers.setup_database_connection

