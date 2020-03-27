class FollowersController < ApplicationController

    def new
        @follow = Follow.new
    end

    def create
        follow = Follow.create(followee_id: params[:followee_id], follower_id: current_user.id)

        if follow.valid?
            redirect_to visit_path(follow.followee_id)
        else
            flash[:errors] = follow.errors.full_messages
            redirect_to follow_path
        end
    end

    def delete
        Follow.find(params[:id]).delete
    end
end
