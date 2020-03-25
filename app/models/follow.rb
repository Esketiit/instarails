class Follow < ApplicationRecord
    belongs_to :follower, class_name: 'Account'
    belongs_to :followee, class_name: 'Account'

    validates :follower_id,  uniqueness: {scope: :followee_id, message:"you already follow this person" }
end
