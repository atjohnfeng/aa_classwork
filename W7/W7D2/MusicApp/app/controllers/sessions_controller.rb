class SessionsController < ApplicationController

    def new
        user = User.new
        render :new
    end

   def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            login(user)
            render json: 'You have been logged in'
        else
            render :new
        end
   end

   def destroy
        logout!
        redirect_to new_session_url
   end

end