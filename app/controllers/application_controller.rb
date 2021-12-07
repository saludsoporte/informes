class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end
    protected

    def configure_permitted_parameters
        added_attrs = [:login,:username, :email, :password, :password_confirmation, :remember_me,:area,:subdireccion,:direccion,:departamento,:unidad,:id]        
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs

    end 
end
