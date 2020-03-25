class LikesController < ApplicationController

    def create
        like = Like.create

        if like.valid?
            redirect_to accounts_path
        else
            flash[:errors] = like.errors.full_messages
        end
    end

    def delete
        Like.find(params[:id]).delete
    end
end
