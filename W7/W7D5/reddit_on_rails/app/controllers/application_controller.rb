class ApplicationController < ActionController::Base

    helper_method :current_user, :is_logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to new_session_url unless is_logged_in?
    end

    def require_logged_out
        redirect_to users_url if is_logged_in?
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! if is_logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def is_logged_in?
        !!current_user
    end
end
