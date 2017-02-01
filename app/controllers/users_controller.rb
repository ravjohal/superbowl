class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def dashboard
    @prop_bet_sheet = current_user.prop_bet_sheet
    @prop_bet_sheets_count = current_user.prop_bet_sheet
    @user = current_user
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def past_winners
    
  end

end
