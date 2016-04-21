class PresentationsController < ApplicationController
  def index
    if user_signed_in?
      @profile = current_user.profile
    end
    @presentations = Presentation.all.order(created_at: :desc)
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

  private

  def presentation_params
    params.require(:presentation).permit(
      :title,
      :description
      ).merge(user: current_user)
  end
end
