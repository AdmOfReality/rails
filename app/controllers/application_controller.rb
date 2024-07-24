# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    user.is_a?(Admin) ? admin_tests_path : root_path
  end

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
