class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :account
    
    validates :comment,  length: {minimum: 1}


end
