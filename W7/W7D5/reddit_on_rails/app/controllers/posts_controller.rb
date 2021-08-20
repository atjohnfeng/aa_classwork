class PostsController < ApplicationController

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        if @post
            @post.sub_id = params(:sub_id)
            @post.author_id = current_user.id
            if @post.save
                render :show
            else
                flash[:errors] = ["failed to create post"]
                redirect_to post_url(params(:sub_id))
            end
        else
            flash[:errors] = ["bad params"]
            redirect_to post_url(params(:sub_id))
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        if @post
            render :show
        else
            flash[:errors] = ["bad params"]
            redirect_to post_url(params(:sub_id))
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        if @post && @post.is_owner?
            render :edit
        elsif @post
            flash[:errors] = @post.errors.full_messages
            redirect_to post_url(params(:sub_id))
        else
            flash[:errors] = ["no post with that id"]
            redirect_to post_url(params(:sub_id))
        end
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post && @post.is_owner? && @post.update(post_params)
            render :show
        elsif @post
            flash[:errors] = @post.errors.full_messages
            redirect_to post_url(params(:sub_id))
        else
            flash[:errors] = ["no post with that id"]
            redirect_to post_url(params(:sub_id))
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if @post && @post.is_owner? && @post.destroy
            redirect_to sub_url(params[:sub_id])
        elsif @post
            flash[:errors] = @post.errors.full_messages
            redirect_to post_url(params(:sub_id))
        else
            flash[:errors] = ["no post with that id"]
            redirect_to post_url(params(:sub_id))
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
