class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
    resource.class == Shop ? shop_path(resource) : customer_path(resource)
    else
      root_path
    end
  end

end
