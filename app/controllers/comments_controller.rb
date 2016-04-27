class CommentsController < ApplicationController
  def new
    @presentation = Presentation.find(params[:presentation_id])
    @comment = Comment.new
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @presentation = Presentation.find(params[:presentation_id])

    if @comment.save
      flash[:notice] = "Comment added successfully!"
      redirect_to presentation_path(@presentation)
    else
      flash[:error] = "Comment must have body."
      render :new
    end
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(presentation: Presentation.find(params[:presentation_id]), user: current_user)
  end
end
