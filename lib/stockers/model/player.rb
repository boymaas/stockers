module Stockers
  module Model
    class Player 

      include DataMapper::Resource

      belongs_to :account
      has 1, :portfolio

      property :id                      , Serial
      property :email                   , String, :required => true, :unique => true, :format => :email_address
      property :nick                    , String, :required => true, :unique => true
      property :fullname                , String
      property :encrypted_password      , String
      property :reset_password_token    , String
      property :reset_password_sent_at  , DateTime
      property :remember_created_at     , DateTime
      property :sign_in_count           , Integer
      property :current_sign_in_at      , DateTime
      property :last_sign_in_at         , DateTime
      property :current_sign_in_ip      , String
      property :last_sign_in_ip         , String
      property :created_at              , DateTime
      property :updated_at              , DateTime
    end
  end
end
