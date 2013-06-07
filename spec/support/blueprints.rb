require 'machinist/active_record'

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
      account 
      portfolio
    end


    Account.blueprint do
      balance { 0.0 }
    end

    Portfolio.blueprint do
      name { "portfolio#{sn}" } 
    end

  end
end

