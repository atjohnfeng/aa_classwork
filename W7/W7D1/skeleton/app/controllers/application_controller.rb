class ApplicationController < ActionController::Base
    # skip_forgery_protection

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def login_user(user)
        @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        if @user
            login(@user)
            redirect_to cats_url
        else
            render :new
        end
    end

    def logged_in?
        !!current_user
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def require_logged_out
        redirect_to cats_url if logged_in?
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

end