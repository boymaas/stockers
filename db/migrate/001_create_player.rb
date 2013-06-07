class CreatePlayer < ActiveRecord::Migration
  def change
    # NOTE: all devise columns present ...
    create_table :players do |t|
      t.references "account" 
      t.string     "email",                  :default => "", :null => false
      t.string     "nick"
      t.string     "fullname"
      t.string     "encrypted_password",     :default => "", :null => false
      t.string     "reset_password_token"
      t.datetime   "reset_password_sent_at"
      t.datetime   "remember_created_at"
      t.integer    "sign_in_count",          :default => 0
      t.datetime   "current_sign_in_at"
      t.datetime   "last_sign_in_at"
      t.string     "current_sign_in_ip"
      t.string     "last_sign_in_ip"
      t.datetime   "created_at",             :null => false
      t.datetime   "updated_at",             :null => false
    end
  end
end

