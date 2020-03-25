class Post < ApplicationRecord
  belongs_to :account
  has_many :likes
  has_many :comments
end
