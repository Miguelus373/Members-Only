class ApplicationController < ActionController::Base
    # helper_method :current_member, :logged_in?

    # def current_member
    #     @current_member ||= Member.find(session[:member_id]) if session[:member_id]
    # end

    # def logged_in?
    #     !current_member.nil?
    # end

    # def require_member
    #     return if logged_in?
    #     flash[:alert] = 'You must be logged in to perform that action'
    #     redirect_to login_path
    # end
end
