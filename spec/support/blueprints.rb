require 'machinist'
require 'dm-machinist'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

module Stockers
  module Model

    Player.blueprint do
      email { "player#{sn}@example.com" }
      nick { "nick#{sn}" }
      account 
      portfolio
    end


    Account.blueprint do
      balance { 0.0 }
    end

    Portfolio.blueprint do
      name { "portfolio#{sn}" } 
    end

    PortfolioShare.blueprint do
      
    end

    Market.blueprint do
      account

      name { "market#{sn}"}
      label { "market_label_#{sn}"}
      description { "description of market"}
      # open { "9:00" }
      # close { "18:00" }
      active { true }

      market_shares(10)
    end

    MarketShare.blueprint do
      name { "market_share_#{sn}"}
      company_name { "company_name_#{sn}"}
      summary { "summary_#{sn}"}
      price { 50.0 }
      infolink { "http://www.marketshare.com/#{sn}" }
    end

  end
end

