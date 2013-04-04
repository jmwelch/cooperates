class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  	def track_activity(trackable, action = params[:action])
  	current_user.activities.create! action: action, trackable: trackable
	end
  
  def after_sign_in_path_for(resource)
      stored_location_for(resource) || root_url
  end
  
end
