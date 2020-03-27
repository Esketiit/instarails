class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
       
        @comment = Comment.new(comments_params)
        @comment.account_id = current_user.id
       if @comment.save
        redirect_to home_path
       else
         redirect_to home_path
       end
       
    end

    def destroy
        @comment = Comment.find(post_id: params[:post_id])
        @comment.destroy
       redirect_to(@comment.post)

        # @post = Post.find(params[:post_id])
        # @comment = @post.comments.find(params[:id])
        # @comment.destroy
        # redirect_to post_path(@post)
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
