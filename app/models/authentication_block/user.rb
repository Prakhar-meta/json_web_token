module AuthenticationBlock
    class User < ApplicationRecord
      self.table_name  = :users
      
      has_secure_password

      validates :username, presence: true, uniqueness: true
      validates :email, presence: true
      validates :password, presence: true 
    
    end
  end