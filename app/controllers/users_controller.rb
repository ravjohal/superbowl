class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def dashboard
    @propbetsheets_count = current_user.propbetsheets.count
    @user = current_user
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

end
