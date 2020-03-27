class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
       #@comment = Comment.create(comment_params)
       #@comment.account_id = current_user.id 
        @comment = Comment.create(comments_params)
       if @comment.valid?
        redirect_to home_path
       else redirect_to home_path
       end
    end

    # def edit
    #     @comment = Comment.find(params[:id])
    # end

    # def update
    #     Comment.find(params[:id]).update(params[:content])
    # end

    # def delete
    #     Comment.find(params[:id]).delete
    # end
    private
    def comments_params
    params.require(:comment).permit!
    end
end
