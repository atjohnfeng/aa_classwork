class UsersController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login_user(@user)
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end