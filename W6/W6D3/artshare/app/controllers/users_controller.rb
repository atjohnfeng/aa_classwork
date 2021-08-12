class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json: {error: 'There is no user with that id.'}, status: 404
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.nil?
      render json: {error: 'There is no user with that id.'}, status: 404
      return
    end
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
    else
      render json: {error: 'There is no user with that id.'}, status: 404
    end
  end

  def index
    debugger
    if params.has_key?(:username)
      @users = User.where('users.username ILIKE ?', params[:username])
    else
      @users = User.all
    end
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end