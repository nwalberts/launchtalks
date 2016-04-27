class PresentationsController < ApplicationController
  def index
    if user_signed_in?
      @profile = current_user.profile
    end

    if params[:search]
      @presentations = Presentation.search(params[:search]).order(created_at: :desc)
    else
      @presentations = Presentation.all.order(:title)
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    @user = current_user
    if @presentation.save
      flash[:notice] = "Presentation added successfully"
      redirect_to presentation_path(@presentation)
    else
      flash[:error] = @presentation.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
  end

  def update
    @presentation = Presentation.find(params[:id])
    if current_user == @presentation.user
      @presentation = Presentation.find(params[:id])
      if @presentation.update(presentation_params)
        flash[:notice] = "Successfully updated presentation!"
        redirect_to presentation_path(@presentation)
      else
        flash[:alert] = "You are not allowed to edit this presentation!"
        render :edit
      end
    end
  end

  private

  def presentation_params
    params.require(:presentation).permit(
      :title,
      :description,
      :video
      ).merge(user: current_user)
  end
end
