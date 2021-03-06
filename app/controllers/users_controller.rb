class UsersController < ApplicationController
  def index
    @users = User.all.order(:first_name).page params[:page]
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully deleted user!"
    redirect_to users_path
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_attribute :role, "admin"
    flash[:notice] = "Successfully made user admin!"
    redirect_to users_path
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
