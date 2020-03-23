class Account < ApplicationRecord
  
    has_secure_password
    has_many :posts
    has_many :likes
end
