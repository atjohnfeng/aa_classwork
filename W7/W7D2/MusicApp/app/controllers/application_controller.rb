class ApplicationController < ActionController::Base

    skip_forgery_protection

    helper_method :current_user, :logged_in?

    def login(user)
        session[:session_token] = user.reset_session_token!
    end
    
    def log_in!(user)
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            login(user)
            redirect_to user_url(user)
        else
            render :new
        end
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logout!
        current_user.reset_session_token if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def logged_in?
        !!current_user
    end

end
