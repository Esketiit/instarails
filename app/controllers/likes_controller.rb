class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]
    
    def create
        if already_liked?
          flash[:notice] = "You can't like more than once"
        else
          @post.likes.create(account_id: current_user.id)
        end
        redirect_to post_path(@post)
      end

      def find_like
        @like = @post.likes.find(params[:id])
     end

      def destroy
        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end
        redirect_to post_path(@post)
      end
    private
    def find_post
      @post = Post.find(params[:post_id])
    end

    def already_liked?
        Like.where(account_id: current_user.id, post_id:
        params[:post_id]).exists?
      end
    # def create
    #     like = Like.create

    #     if like.valid?
    #         redirect_to accounts_path
    #     else
    #         flash[:errors] = like.errors.full_messages
    #     end
    # end

    # def delete
    #     Like.find(params[:id]).delete
    # end

    
end
