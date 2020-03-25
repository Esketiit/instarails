class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        comment = Comment.create(params[:id])

        if comment.validate?
            redirect_to accounts_path
        else
            flash[:errors] = comment.errors.full_messages
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        Comment.find(params[:id]).update(params[:content])
    end

    def delete
        Comment.find(params[:id]).delete
    end
end
