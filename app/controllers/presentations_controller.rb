class PresentationsController < ApplicationController
  def index
      @presentations = Presentation.all.order(created_at: :desc)
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def new
    @presentation = Presentation.new
  end
end
