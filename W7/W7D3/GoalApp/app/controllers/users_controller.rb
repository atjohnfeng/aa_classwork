class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Invalid username or password.']
            render :new
        end
    end

    def index
        @users = User.all 
        render :index 
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end