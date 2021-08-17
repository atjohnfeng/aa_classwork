class CatsController < ApplicationController
  before_action :verify_owner, only: [:edit, :update]

  def verify_owner
    @cat = Cat.find_by(id: params[:id])
    @owned_cats = current_user.cats 
    redirect_to new_session_url if !@owned_cats.include?(@cat)
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @current_user = current_user
    if !@current_user
      redirect_to new_user_url 
      return 
    end 
    @cat.owner_id = @current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
