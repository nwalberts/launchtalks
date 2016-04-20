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
end
