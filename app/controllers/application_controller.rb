class ApplicationController < ActionController::Base
helper_method :current_user
# before_action :current_user
  def current_user
    if session[:account_id]
      @current_user ||= Account.find(session[:account_id])
      # flash[:account_id] = @current_user.id
    else
      @current_user = nil
    end
  end

  def full_name
   @full_name = "#{self.first_name} #{self.last_name}"
end
end
