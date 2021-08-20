class SubsController < ApplicationController
    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub
            @sub.mod_id = current_user.id
            render :show if @sub.save
        else
            flash.now[:errors] = ["failed to create sub"]
            render :new
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        if @sub
            render :show
        else
            flash[:errors] = ["no sub with that id"]
            redirect_to subs_url
        end
    end

    def index
        @subs = Sub.all
        render :index
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        if @sub && @sub.mod_id == current_user.id
            render :edit
        elsif @sub
            flash[:errors] = @sub.errors.full_messages
            redirect_to subs_url
        else
            flash[:errors] = ["no sub with that id"]
            redirect_to subs_url
        end
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update_attributes(sub_params)
            render :show
        elsif @sub
            flash[:errors] = @sub.errors.full_messages
            redirect_to subs_url
        else
            flash[:errors] = ["no sub with that id"]
            redirect_to subs_url
        end
    end

    def destroy
        @sub = Sub.find_by(id: params[:id])
        if @sub && @sub.mod_id == current_user.id && @sub.destroy
            redirect_to subs_url
        elsif @sub
            flash[:errors] = @sub.errors.full_messages
            redirect_to subs_url
        else
            flash[:errors] = ["no sub with that id"]
            redirect_to subs_url
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
