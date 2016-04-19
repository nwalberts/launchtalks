class PresentationsController < ApplicationController
  def index
      @presentations = Presentation.all.order(created_at: :desc)
  end

  def new
    @presentation = Presentation.new
  end
end
