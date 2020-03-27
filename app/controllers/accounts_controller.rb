class AccountsController < ApplicationController
    
    def followers
        @account =  Account.find(current_user.id)
    end

    def followees
        @account =  Account.find(current_user.id)
        @posts = @account.posts
    end

    def visit
        @account =  Account.find(params[:id])
        @posts = @account.posts
    end
    
    def index
        @test = Account.find(current_user.id).followees
        @posts = []
        @test.each do |account|
            account.posts.each do |post|
                @posts << post
            end
        end
        @comment = Comment.new
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
            redirect_to login_path
        else
            flash[:errors] = @account.errors.full_messages 
            redirect_to signup_path
        end
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

    def destroy
        @account = Account.find(params[:id])
        @account.posts.each do |p|
            p.delete
        end

        @account.followers.each do |f|
            f.delete
        end

        @account.followees.each do |f|
            f.delete
        end
        @account.delete
        session[:account_id] = nil
        redirect_to root_path
    end

    def account_params
        params.require(:account).permit!
    end
end
