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
 	  if current_user.prop_bet_sheets
      prop_bet_sheets_path
    else
      user_root_path
    end
  end

  def set_super_bowl
  	@super_bowl = SuperBowl.last
    @current_super_bowl_id = @super_bowl.id
  end

  def admin_only
    unless current_user.role == 1
      redirect_to root_path
    end
  end

  def redirect_user_deadline
    time_zone = 'Pacific Time (US & Canada)'
    Time.zone = time_zone
    sub = Time.zone.parse("2020-02-02 15:20")
    Rails.logger.info("time now " + Time.now.strftime("%m/%d/%y %I:%M %p") + "    Time COMPARING: "  + sub.strftime("%m/%d/%y %I:%M %p"))
    if Time.now > sub
      redirect_to root_path
    end
  end
end
