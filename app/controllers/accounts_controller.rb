class AccountsController < ApplicationController
    def index
        #feed
        @posts = Post.all

    end

    def show
        @account =  Account.find(current_user.id)
        @posts = @account.posts
        #profile, all posts of this specific user

        # @account = Account.find(params[:id])
        # @posts = Post.all

        #or
        #@posts = @account.posts.all? does all work
    end
    
    def new 
        #for sign up
        @account = Account.new
        end
    
    
    def create
        @account = Account.new(acount_params)
        if @account.save
            flash[:notice] = "You signed up successfully"
            flash[:color]= "valid"
          else
            flash[:notice] = "Form is invalid"
            flash[:color]= "invalid"
          end
          render "new"
    end

    def acount_params
        params.require(:account).permit(:user_name, :password, :first_name,:last_name )
    end
end
