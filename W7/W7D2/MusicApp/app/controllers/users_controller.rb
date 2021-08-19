class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def show
        user = User.find(params[:id])
        render :show
    end

    def create
        user = User.new(user_params)
        if user.save
            log_in!(user)
        else
            render :new
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy if user
        redirect_to new_session_url
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end

end