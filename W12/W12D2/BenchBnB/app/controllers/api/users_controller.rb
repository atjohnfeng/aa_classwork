class Api::UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            render :show
        else
            render json: @user.errors.full_messages, status: 401
        end
    end

    def update
        @user = User.find(params[:id])
        if @user && @user.update(user_params)
            render :show
        elsif !@user
            render json: ['User could not be found.'], status: 400
        else
            render json: @user.errors.full_messages, status: 401
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render :show
        else
            render json: ['User could not be found.']
        end
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end