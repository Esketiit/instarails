class PostsController < ApplicationController
    

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.account_id = current_user.id
        if @post.save
            redirect_to post_path(@post.id)
            # redirect_to account_path(current_user.id)
        else
            flash[:errors]= @post.errors.full_messages
            redirect_to upload_path
        end
        #post = Post.create(post_params)
        #if post.valid?
        #redirect_to account_path(params[:account_id])
        
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy 
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to account_path
    end
private
    def post_params
        params.require(:post).permit!()
    end
end
