class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      render :json => @comment
    else
      render :json => @comment.error, :status => 418
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      render :json => @comment
    else
      render :json => @comment.error, :status => 418
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    head :ok
  end


end
