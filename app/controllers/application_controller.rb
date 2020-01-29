class ApplicationController < ActionController::Base
  devise_group :user, contains: [:teacher, :student, :parent]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_schema

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def load_schema
    begin
      Apartment::Tenant.switch!(request.subdomain)
    rescue
      redirect_to "https://vitualizz.github.io"
    end
  end
end
