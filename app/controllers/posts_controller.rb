class PostsController < ApplicationController
    

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post.id)
        else 
            render :new
        end
        #post = Post.create(post_params)
        #if post.valid?
        #redirect_to account_path(params[:account_id])
        #else
        #flash[:errors]= post.errors.full_messages
        #redirect_to upload_path
        #
    end

    def show

    end

    def post_params
        params.require(:post).permit!
    end
end
