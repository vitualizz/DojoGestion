class ApplicationController < ActionController::Base
  include ApplicationHelper

  devise_group :user, contains: [:teacher, :student, :parent]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_schema
  before_action :validate_session_new
  before_action :school
  before_action :setting
  before_action :set_locale

  private

  def setting
    @setting = Setting.first
  end

  def school
    @school = School.find_by(subdomain: Apartment::Tenant.current)
  end

  def set_locale
    lang = params[:lang]
    I18n.locale = lang || @school.locale.to_sym || :es
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def validate_session_new
    redirect_to root_path if user_signed_in? && params[:controller].eql?("devise/sessions") && params[:action].eql?("new")
  end

  def load_schema
    begin
      Apartment::Tenant.switch!(request.subdomain)
    rescue
      redirect_to "https://vitualizz.github.io"
    end
  end
end
