class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :account
    
    validates :content,  length: {minimum: 1}


end
