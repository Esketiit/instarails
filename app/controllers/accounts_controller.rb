class AccountsController < ApplicationController
    def index
        #feed

    end
    def show
        #profile
    end
    
    def new 
        #for sign up
      
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
