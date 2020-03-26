class FollowersController < ApplicationController

    def new
        @follow = Follow.new
        @follow.followee_id = params[:id]
    end

    def create
        follow = @follow.create(params[:id])

        if follow.valid?
            redirect_to accounts_path
        else
            flash[:errors] = follow.errors.full_messages
            redirect_to accounts_path
        end
    end

    def delete
        Follow.find(params[:id]).delete
    end
end
