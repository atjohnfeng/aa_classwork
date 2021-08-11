class UsersController < ApplicationController

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
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
    if @user.nil
      render json: {error: 'There is no user with that id.'}, status: 404
      return
    end
    if @user.update(params.require(:user).permit(:name, :email))
      redirect_to user_url(@user)
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      redirect_to user_url
    else
      @render json: {error: 'There is no user with that id.'}, status: 404
    end
  end

  def index
    @users = User.all
    render json: @users
  end

end