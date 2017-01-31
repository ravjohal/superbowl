class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_super_bowl

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
 	  if current_user.prop_bet_sheet
      prop_bet_sheets_path
    else
      user_root_path
    end
  end

  def set_super_bowl
  	@super_bowl = SuperBowl.first
    @current_super_bowl_id = @super_bowl.id
  end
end
