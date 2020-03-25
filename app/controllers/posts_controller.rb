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
    end

    def show

    end

    def post_params
        params.require(:post).permit(:image, :description)
    end
end
