class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    if @comment
      @comment.destroy
    else
      render json: {error: "There is no comment by that id."}, status: 404
    end
  end

  def index
    debugger
    if params[:user_id]
      @comments = Comment.where('user_id = ?', params[:user_id])
    elsif params[:artword_id]
      @comments = Comment.where(artwork_id: params[:artwork_id])
    else
      @comments = Comment.all
    end
    render json: @comments
  end


  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end