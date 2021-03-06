class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:country])
		devise_parameter_sanitizer.permit(:account_update, keys: [:country])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:city])
		devise_parameter_sanitizer.permit(:account_update, keys: [:city])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:street])
		devise_parameter_sanitizer.permit(:account_update, keys: [:street])
	end

end
