

class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        if @cat
            render :show
        else
            render json: {error: "There is no cat"}#, status 404
        end
    end

    def new
        render :new
    end

    def create
        cat_params[:birth_date] = Date.parse(cat_params[:birth_date])
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    def update
        @cat = Cat.find_by(id: params[:id])
        unless @cat
            render json: {error: "That cat does not exist"}, status: 404
            return
        end
        
        if Cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end

end