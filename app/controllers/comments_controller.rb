class CommentsController < ApplicationController
  def index
    # @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to cocktails_path(@comment)
    else
      render :new
    end
  end

  private 

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :nacionality, :email, :comment)
  end

end
