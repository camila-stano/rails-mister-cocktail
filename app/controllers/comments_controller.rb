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
      redirect_to new_comment_dose_path(@comment)
    else
      render :new
    end
  end
end
