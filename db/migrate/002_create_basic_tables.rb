class CreateBasicTables < ActiveRecord::Migration
  def change
    # NOTE: all devise columns present ...
    create_table :portfolios do |t|
      t.references :player
      t.string :name
    end

    create_table :portfolio_shares do |t|
      t.references :portolio
      t.references :market_share
      t.float      :price, :default => 0.0
      t.integer    :count
    end

    create_table :market_trades do |t|
      t.references :market
      t.references :market_share
      t.integer    :seller_id
      t.integer    :buyer_id
      t.float      :value_purchased
      t.float      :value_sold
      t.integer    :count
      t.float      :transaction_costs
      t.timestamps
    end

    create_table :market_shares do |t|
      t.references :market 
      t.string     :name 
      t.string     :company_name
      t.string     :summary
      t.float      :price, :default => 0.0 
      t.string     :infolink
    end

    create_table :markets do |t|
      t.references :account 
      t.string     :name 
      t.string     :description 
      t.string     :label 

      t.time       :open 
      t.time       :close 
      t.booelan    :active 
      t.boolean    :disabled 
      t.boolean    :is_currency 
    end

    create_table :accounts do |t|
      t.float      :balance
    end
    
    create_table :transactions  do |t|
      t.references :account
      t.float      :account_balance
      t.float      :amount
    end
  end
end

