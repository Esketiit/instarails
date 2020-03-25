class Account < ApplicationRecord

    has_secure_password

    has_many :posts
    has_many :likes
    has_many :comments
    
    # this allows an account to see who is following them
    has_many :followed_accounts, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_accounts
    # this allows an account to see who they are following
    has_many :following_accounts, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_accounts
    validates :user_name, presence:true, uniqueness:true
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
