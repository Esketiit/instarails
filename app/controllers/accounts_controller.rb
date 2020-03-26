class AccountsController < ApplicationController
    
    def followers
        @account =  Account.find(current_user.id)
    end

    def followees
        @account =  Account.find(current_user.id)
    end
    
    def index
        @posts = Post.all

    end

    def show
        @account =  Account.find(current_user.id)
        @posts = @account.posts
    end
    
    def new 
        @account = Account.new
        end
    
    
    def create
        @account = Account.new(account_params)
        if @account.save
            flash[:notice] = "You signed up successfully"
            flash[:color]= "valid"
        else
            flash[:notice] = "Form is invalid"
            flash[:color]= "invalid"
        end
        render "new"
    end

    def edit
        @account = Account.find(params[:id])
    end

    def update
        @account = Account.find(params[:id])

        if  @account.update(account_params)
            redirect_to profile_path
        else
            flash[:errors] = @account.errors.full_messages
            redirect_to edit_account_path(@account.id)
        end

    end

    def account_params
        params.require(:account).permit!
    end
end
